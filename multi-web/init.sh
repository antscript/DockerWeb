#! /bin/bash

cd `dirname "$0"`

mkdir /etc/dockerWeb/nginx/conf.d/ -p
cat /etc/dockerWeb/web.lst | while read -r LINE
do
	site_container=${LINE}
	read -r LINE
	domain=${LINE}
	read -r LINE
	https=${LINE}

    cmd=${cmd}" --link="
	cmd=${cmd}${site_container}
	cmd=${cmd}":"
	cmd=${cmd}$site_container
	echo $cmd > .cmd

	mkdir -p /etc/dockerWeb/nginx/conf.d/
	docker cp ${site_container}:/etc/nginx/conf.d/default.conf /etc/dockerWeb/nginx/conf.d/${site_container}.conf

	sed -i "s/localhost/${domain} *.${domain}/g" /etc/dockerWeb/nginx/conf.d/${site_container}.conf
	sed -i "s/index  index.html index.htm;//g" /etc/dockerWeb/nginx/conf.d/${site_container}.conf

	cp hook.conf /etc/dockerWeb/nginx/conf.d/${site_container}_hook.conf
	sed -i "s/localhost/${domain}/g" /etc/dockerWeb/nginx/conf.d/${site_container}_hook.conf
	sed -i "s/domain/${domain}/g" /etc/dockerWeb/nginx/conf.d/${site_container}_hook.conf

	mkdir -p /etc/dockerWeb/https/${site_container}/
	if [ $https = ${site_container}_https_true ]
	then
		docker cp ${site_container}:/data/https/ssl.crt /etc/dockerWeb/https/${site_container}/ssl.crt
		docker cp ${site_container}:/data/https/ssl.key /etc/dockerWeb/https/${site_container}/ssl.key

		sed -i "s#root   /data/DockerWeb/web#proxy_pass https://${domain}:443#g" /etc/dockerWeb/nginx/conf.d/${site_container}.conf
		sed -i "s#/data/https/ssl.crt#/etc/dockerWeb/${site_container}/ssl.crt#g" /etc/dockerWeb/nginx/conf.d/${site_container}.conf
		sed -i "s#/data/https/ssl.key#/etc/dockerWeb/${site_container}/ssl.key#g" /etc/dockerWeb/nginx/conf.d/${site_container}.conf
	else
		sed -i "s#root   /data/DockerWeb/web#proxy_pass http://${domain}#g" /etc/dockerWeb/nginx/conf.d/${site_container}.conf
	fi
done

cmd=`cat .cmd`
echo $cmd
docker stop root-server
docker rm root-server
docker run -d --name=root-server -p 80:80 -p 443:443 -p 9000:9000 $cmd  nginx
docker exec root-server rm -rf /etc/nginx/conf.d/default.conf
docker cp /etc/dockerWeb/nginx/conf.d root-server:/etc/nginx
docker cp /etc/dockerWeb/https/ root-server:/etc/dockerWeb
docker restart root-server

rm -rf .cmd
