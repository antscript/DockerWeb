# What is DockerWeb ?
#### DockerWeb is a website tool.

#### that allows you to easily create a website on your server/vps/cloud etc..

#### and auto deploy with Github or Bitbucket.

***

# Features
* In docker
* Easy to use
* Auto deploy

***

# Usage
### Step 1: Fork and clone DockerWeb
if Bitbucket , Import DockerWeb from Github

### Step 2: SSH key (only Bitbucket require)
copy or generate id_rsa and id_rsa.pub on your server : /root/.ssh/

### Step 3: HTTPS (if necessary)
send your ssl.crt and ssl.key to server

### Step 4: Edit setup/config.sh with your setting

### Setp 5: Commit and push your repository

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

# 3rd party tools
#### [https://github.com/adnanh/webhook](https://github.com/adnanh/webhook)
