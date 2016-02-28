![docker+nginx](https://github.com/antscript/DockerWeb/raw/master/img/dockerweb.png)
# What is DockerWeb ?
#### DockerWeb is a website tool.

#### that allows you to easily create a website with static web page on your server/vps/cloud etc..

#### and auto deploy with Github or Bitbucket.

***

# Features
* **In Docker container**
* **Easy to use** (<a href="https://www.youtube.com/watch?v=VQmeIzExRco" target="_blank">Deploy a static website in 5 minutes with DockerWeb</a>)
* **Auto deploy**

***

# Usage
### Step 1: Fork and clone DockerWeb
if Bitbucket , Import DockerWeb from Github

### Step 2: SSH key (only Bitbucket require)
copy or generate id_rsa and id_rsa.pub on your server : /root/.ssh/

### Step 3: HTTPS (if necessary)
send your ssl.crt and ssl.key to server

### Step 4: Edit setup/config.sh with your setting

### Step 5: Commit and push your repository

### Step 6: Add webhook
```
#Github  
Setting -> Webhooks & services -> add webhook
Payload URL : http(s)://yourdomain.com:9000/hooks/your_webhook_id
```
```
#Bitbucket  
Setting -> Webhooks  -> Add webhook
Title : title you want
URL   : http(s)://yourdomain.com:9000/hooks/your_webhook_id
```

### Step 7: Login your server , clone repo and run setup/setup.sh

### Step 8: Visit your website

### Step 9: Redeploy test

***

# Video tutorial
* **Deploy a static website in 5 minutes with DockerWeb : ** <a href="https://www.youtube.com/watch?v=VQmeIzExRco" target="_blank">https://www.youtube.com/watch?v=VQmeIzExRco</a>

***

# 3rd party tools
#### [https://github.com/adnanh/webhook](https://github.com/adnanh/webhook)

***

[中文](https://github.com/antscript/DockerWeb/blob/master/README_CN.md)
