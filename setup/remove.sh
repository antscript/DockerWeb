#!/bin/sh
cd `dirname "$0"`
. ./config.sh


# remove container
docker stop $site_name
docker rm $site_name

# remove image
docker rmi $site_name-image

# remove config
sed -e "/${site_name}/d"  /etc/dockerWeb/web.lst
sed -e "/${site_domain}/d"  /etc/dockerWeb/web.lst
