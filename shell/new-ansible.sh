#!/bin/bash

if [ "$#" -ne "1" ];then
    echo "USAGE: $0 serverIp"
    exit 1
fi

cd ../ansible

mkdir $1

echo 'ips' > $1/hosts

cat <<EOF >$1/$1.yaml
---
- hosts: all
  tasks:
    - name: example
      shell: echo 'hello world'
EOF

mkdir $1/resource

echo "ansible-playbook -i hosts $1.yaml --private-key=~/.ssh/id_rsa"
