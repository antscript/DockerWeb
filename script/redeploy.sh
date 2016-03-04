#!/bin/sh
GIT_PATH='/data/DockerWeb/'
 
echo "Start deployment"
cd $GIT_PATH
echo "pulling source code..."
git reset --hard
git clean -xdf
git pull
chmod +x /data/DockerWeb/script/redeploy.sh
echo "Finished."