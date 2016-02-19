#!/bin/sh

# copy ssh key to host server before run this script

mkdir -p /data/docker/
cd /data/docker/

cp /root/.ssh/id_rsa .
cp /root/.ssh/id_rsa.pub .

docker build -t=StaticWebInDocker-Image --no-cache .

# expose 80,443,9000 ports
docker run -d  -p 80:80 -p 443:443 -p 9000:9000 --name=StaticWebInDocker StaticWebInDocker-Image

# expose nothing
# docker run -d  -p --name=StaticWebInDocker StaticWebInDocker-Image


rm id_rsa
rm id_rsa.pub