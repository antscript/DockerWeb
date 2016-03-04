#!/bin/sh

# config your site ===================================================================================

# site domain (without http:// and www )
site_domain="example.com"

# site name you want
site_name="your_site_name"

# repository URL 																		==============
# Github use https 	: https://github.com/user/repository.git 						<<== very import =
# Bitbucket use ssh : git@bitbucket.org:user/repository.git 						<<== very import =
# if your repo on Bitbucket , copy or generate id_rsa/id_rsa.pub on your server			==============	
# and add id_rsa.pub to your repo setting on Bitbucket.org	
git_URL="your_repository"

# webhook id you want , such as DPL7ZmPa94eJqDqp
# and add the webhook to Github.com or Bitbucket.org
# your webhook URL like http(s)://your_domain:9000/hooks/DPL7ZmPa94eJqDqp
webhook_id="your_webhook_id"


# advance config ======================================================================================

# if only one website in your server , keep it false
# if multi_site is true , it will not expose port from docker container to host
multi_site=false

# visit your website use https://your_domain/
# if https is true , please send your ssl.crt and ssl.key to server
# and replace https_path with your server path
https=false
https_path="your_ssl.crt/ssl.key_path"