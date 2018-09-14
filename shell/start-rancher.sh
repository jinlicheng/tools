#!/bin/bash

if [ "$#" -ne "1" ];then
    echo "USAGE: $0 version"
    exit 1
fi

docker run -d --name rancher-server --restart=unless-stopped -p 8080:80 -p 8443:443 rancher/rancher:$1 --add-local true
