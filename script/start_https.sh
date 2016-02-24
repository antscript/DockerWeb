#!/bin/sh

cd /data/DockerWeb/webhook

#https on :
nohup ./webhook_linux_amd64 -hooks /data/conf/hooks.json -port=9000 -secure=true -cert="/data/https/ssl.crt" -key="/data/https/ssl.key" -verbose &

chmod +x /data/DockerWeb/script/redeploy.sh

service nginx start