# What is StaticWebInDocker ?
#### StaticWebInDocker is a website tool

#### that allows you to easily create a website on your server

#### and auto deploy with Github or Bitbucket.

# Features
* In docker
* Easy to use
* Auto deploy

# Usage
#### Step 1 : Fork  StaticWebInDocker
#### Step 2 : Copy id_rsa and id_rsa.pub to current directory on your server
#### Step 3 : Edit Dockerfile with your config
replace this line to your Github Repo URL

```
ARG GIT_URL=git@github.com:antscript/StaticWebInDocker.git
```
for Github , nothing to change
for Bitbucket , comment gitbub block , uncomment bitbucket block

```
# ========= github =========
RUN ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
ADD https://github.com/antscript/StaticWebInDocker/raw/master/github_ssl/config /root/.ssh/config
# ========= github end =========


# ========= bitbucket =========
# RUN ssh-keyscan -t rsa bitbucket.org > ~/.ssh/known_hosts
# ========= bitbucket end =========
```
#### Step 4 : Config https (if your do not want use https ,go to next setp)
replace ssl.crt , ssl.key to your domain HTTPS certificate files in https folder
edit default.conf in conf folder , uncomment https on block

```
==> default.conf
# https on ------------------------------------------------
listen       443 ssl;
error_page 497 https://$host$request_uri;
ssl on;
ssl_certificate /data/StaticWebInDocker/ssl/ssl.crt;
ssl_certificate_key /data/StaticWebInDocker/ssl/ssl.key;
ssl_session_cache    shared:SSL:1m;
ssl_session_timeout  5m;
ssl_ciphers  HIGH:!aNULL:!MD5;
ssl_prefer_server_ciphers  on;
# https on -------------------------------------------------
```
rename hooks_xxx.json to hooks.json
edit hooks.json

```
...
"command-working-directory": "/",
-secure=true,
-cert="/data/StaticWebInDocker/ssl/ssl.crt",
-key="/data/StaticWebInDocker/ssl/ssl.key",
"trigger-rule":
...
```
#### Step 5 : Config webhook
edit hooks.json

```
==> hooks.json
replace id value to a random strings , for example:
"id": "github",
to
"id": "uYFVn4e6TgzPc8Hu",
```
add webhook with random strings

```
#Github  
Setting -> Webhooks & services -> add webhook
Payload URL : http(https)://yourdomain.com/hooks/uYFVn4e6TgzPc8Hu
```
```
#Bitbucket  
Setting -> Webhooks  -> Add webhook
Title : anything you like
URL   : http(https)://yourdomain.com/hooks/uYFVn4e6TgzPc8Hu
```
#### Step 6 : Build image and run container
copy setup.sh to your server
if only this website on your server , just run setup.sh 

```
sh setup.sh
```
if multi-website on your server , edit setup.sh , run setup.sh

```
==> setup.sh
# expose 80,443,9000 ports
# docker run -d  -p 80:80 -p 443:443 -p 9000:9000 --name=StaticWebInDocker StaticWebInDocker-Image

# expose nothing
docker run -d  -p --name=StaticWebInDocker StaticWebInDocker-Image
```

```
sh setup.sh
```
#### Step 7 : Test and have fun