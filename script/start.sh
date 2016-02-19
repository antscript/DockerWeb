#!/bin/sh

cd /data/StaticWebInDocker/webhook

#https off :
nohup ./webhook_linux_amd64 -hooks /data/StaticWebInDocker/webhook/hooks.json -port=9000 -verbose &

#https on :
#nohup ./webhook_linux_amd64 -hooks /data/StaticWebInDocker/webhook/hooks.json -port=9000 -secure=true -cert="/data/StaticWebInDocker/https/ssl.crt" -key="/data/StaticWebInDocker/https/ssl.key" -verbose &

chmod +x /data/StaticWebInDocker/script/redeploy.sh

service nginx start