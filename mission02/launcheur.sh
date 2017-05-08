cp ~/.ssh/id_rsa.pub .
docker build -t 42ssh .
docker run -d -P --name container 42ssh
ssh -v vpailhe@`boot2docker ip` -p `docker port container 42 | cut -d ':' -f 2`
