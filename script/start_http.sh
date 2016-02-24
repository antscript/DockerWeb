#!/bin/sh

cd /data/DockerWeb/webhook

#https off :
nohup ./webhook_linux_amd64 -hooks /data/conf/hooks.json -port=9000 -verbose &

chmod +x /data/DockerWeb/script/redeploy.sh

service nginx start