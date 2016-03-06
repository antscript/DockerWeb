#!/bin/sh
cd `dirname "$0"`
. ./config.sh


# Config Dockerfile
rm -rf ../docker
mkdir -p ../docker
cd ../docker
mkdir -p temp
if [[ $git_URL == *"github.com"* ]]
then
	sed -e "s#webhook_id#$webhook_id#g" ../webhook/hooks_github.json >> temp/hooks.json
	if [ $https = true ]
	then	
		sed -e "s#your_git_url#$git_URL#g" ../dockerfile/Dockerfile_Github_https >> ../docker/Dockerfile
	else
		sed -e "s#your_git_url#$git_URL#g" ../dockerfile/Dockerfile_Github >> ../docker/Dockerfile
	fi
else
	cp /root/.ssh/id_rsa temp
	cp /root/.ssh/id_rsa.pub temp
	sed -e "s#webhook_id#$webhook_id#g" ../webhook/hooks_bitbucket.json >> temp/hooks.json
	if [ $https = true ]
	then	
		sed -e "s#your_git_url#$git_URL#g" ../dockerfile/Dockerfile_Bitbucket_https >> ../docker/Dockerfile
	else
		sed -e "s#your_git_url#$git_URL#g" ../dockerfile/Dockerfile_Bitbucket >> ../docker/Dockerfile
	fi
fi

if [ $multi_site = true ]
then
        sed -i "s#master#$site_name#g" ../docker/Dockerfile
        sed -i "s#master#$site_name#g" temp/hooks.json
fi



# Config nginx http/https
if [ $https = true ]
then
	cp ../conf/nginx.conf temp/nginx.conf
	cp ../conf/default_https.conf temp/default.conf
	cp ../script/start.sh temp/start.sh
	cp $https_path/ssl.crt temp/ssl.crt
	cp $https_path/ssl.key temp/ssl.key
else
	cp ../conf/nginx.conf temp/nginx.conf
	cp ../conf/default_http.conf temp/default.conf
	cp ../script/start.sh temp/start.sh
fi

# Setup Docker
docker build -t=$site_name-image --no-cache .
#docker build -t=$site_name-image .

if [ $multi_site = true ]
then
	docker run -d --name=$site_name-web $site_name-image
else
	docker run -d -p 80:80 -p 443:443 -p 9000:9000 --name=$site_name-web $site_name-image
fi

# clean temp folder
rm -rf ../docker

# log setup
mkdir /etc/dockerWeb -p
echo $site_name >> /etc/dockerWeb/web.lst
echo $site_domain >> /etc/dockerWeb/web.lst
echo ${site_name}-web_https_${https} >> /etc/dockerWeb/web.lst