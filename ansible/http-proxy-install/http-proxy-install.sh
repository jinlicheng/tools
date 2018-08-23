#!/bin/bash

if [ "$#" -ne "6" ];then
    echo "USAGE: $0 serverIp serverPort password polipoListenAddress polipoListenPort privateKey"
    exit 1
fi

ansible-playbook -i hosts http-proxy-install.ymal --private-key $6 --extra-vars "serverIp=$1 serverPort=$2 password=$3 ppIpAddress=$4 ppPort=$5"

exit 0

