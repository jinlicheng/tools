#!/bin/bash

apt install python python-pip

pip install —upgrade pip
sed -i -e 's/from pip import main/from pip._internal import main/g' /usr/bin/pip
Export LC_ALL=C

pip install --upgrade setupTools
Pip install shadowsocks

Ssserver -p 52122 -k Jlcsvpc@15301 -m aes-256-cfb —user nobody -d start
