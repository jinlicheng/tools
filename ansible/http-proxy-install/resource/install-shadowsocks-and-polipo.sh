#!/bin/bash

if [ "$#" -ne "3" ];then
    echo "USAGE: $0 serverIp serverPort password"
    exit 1
fi

apt update
apt install python-pip python-setuptools m2crypto
export LC_ALL="C"
pip install shadowsocks

mkdir /etc/shadowsocks
cat <<EOF >/etc/shadowsocks/config.json
{
  "server":"$1",
  "server_port":$2,
  "local_address":"127.0.0.1",
  "local_port":1080,
  "password":"$3",
  "timeout":300,
  "method":"aes-256-cfb",
  "fast-open": false
}
EOF

cat <<EOF > /etc/systemd/system/multi-user.target.wants/shadowsocks.service
[Unit]
Description=shadowsocks service
After=network.target firewalld.service

[Service]
Type=forking
Restart=no
TimeoutSec=5min
IgnoreSIGPIPE=no
KillMode=process
GuessMainPID=no
ExecStart=/usr/local/bin/sslocal -c /etc/shadowsocks/config.json -d start
ExecStop=/usr/local/bin/sslocal -c /etc/shadowsocks/config.json -d stop

[Install]
WantedBy=multi-user.target

EOF

systemctl daemon-reload
systemctl restart shadowsocks

apt install -y polipo
cat <<EOF >> /etc/polipo/config
socksParentProxy = 127.0.0.1:1080
socksProxyType = socks5
proxyAddress = 127.0.0.1
proxyPort = 8123
EOF

/etc/init.d/polipo stop
/etc/init.d/polipo start
