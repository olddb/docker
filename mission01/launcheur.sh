docker build -t hello/world .
docker run --name gros-port -d -p 8080:80 hello/world
docker tag hello/world:latest hello/world:v42
docker rmi hello/world:latest
open http://192.168.59.103:8080
docker run -i -t hello/world:v42 /bin/bash
