#!/bin/bash

# http_proxy like http://127.0.0.1:8123
# noProxy like 192.168.0.0/16,172.18.0.0/16
# apiServer is a ip
# podNewwork is cidr like 192.168.0.0/16

if [ "$#" -ne "4" ];then
    echo "USAGE: $0 httpProxy noProxy apiserver podNetwork"
    exit 1
fi

# make http proxy for next steps
export http_proxy=$1
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export no_proxy=$2
export NO_PROXY=$no_proxy

# install kubelet kubeadm kubectl
echo "install kubelet kubeadm kubectl"
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
# apt-mark hold kubelet kubeadm kubectl
systemctl enable kubelet

# traffic being routed incorrectly due to iptables being bypassed
ehco "traffic being routed incorrectly due to iptables being bypassed"
cat <<EOF > /etc/sysctl.d/k8s.conf
net.ipv4.ip_forword = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

# install k8s with kubeadm
kubeadm init --apiserver-advertise-address=$3 --pod-network-cidr=$4 --ignore-preflight-errors=all
