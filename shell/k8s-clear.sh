#!/bin/bash

df -h|grep kubelet |awk -F % '{print $2}'|xargs umount 
rm /var/lib/kubelet/* -rf
rm /etc/kubernetes/* -rf
rm /var/lib/etcd/* -rf
rm /var/lib/cni/* -rf

iptables -F && iptables -t nat -F

ip link del flannel.1

docker ps -a|awk '{print $1}'|xargs docker rm -f
docker volume ls|awk '{print $2}'|xargs docker volume rm

rm -rf /var/etcd/
rm -rf /run/kubernetes/
docker rm -fv $(docker ps -aq)
docker volume rm  $(docker volume ls)
rm -rf /etc/kubernetes/
rm -rf /var/lib/etcd/
rm -rf /etc/cni
rm -rf /opt/cni
rm -rf /var/lib/cni

rm -rf /var/run/calico 

rm -rf /var/lib/kubelet/

