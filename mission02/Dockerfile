FROM ubuntu:14.04

RUN useradd -ms /bin/bash vpailhe
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN echo 'vpailhe:password' | chpasswd

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -i 's/Port 22/Port 42/' /etc/ssh/sshd_config
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/\#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -i 's/\RhostsRSAAuthentication no/RhostsRSAAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/\#AuthorizedKeysFile/AuthorizedKeysFile/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 42

RUN mkdir /home/vpailhe/.ssh
RUN chmod 0700 /home/vpailhe/.ssh
COPY id_rsa.pub /home/vpailhe/.ssh/authorized_keys
RUN chmod 0600 /home/vpailhe/.ssh/authorized_keys
RUN chmod 755 /home/vpailhe
RUN chown -R vpailhe:vpailhe home/vpailhe/.ssh
CMD ["/usr/sbin/sshd", "-D"]
