#!/bin/bash

if [ "$#" -ne "1" ];then
    echo "USAGE: $0 version"
    exit 1
fi

rm -rf /Users/kelvin/Workspaces/docker-volumes/rancher

docker run -d --name=rancher-server -v /Users/kelvin/Workspaces/docker-volumes/rancher:/var/lib/rancher --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:$1 --add-local true
