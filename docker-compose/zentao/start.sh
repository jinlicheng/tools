#!/bin/bash

# mkdir -p /data/zbox && docker run -d -p 80:80 -p 3306:3306 \
#	-e USER="root" -e PASSWD="password" \
#    -e BIND_ADDRESS="false" \
#    -e SMTP_HOST="163.177.90.125 smtp.exmail.qq.com" \
#    -v /data/zbox/:/opt/zbox/ \
#    --name zentao-server \
#    idoop/zentao:latest


mkdir -p /data/zbox
docker-compose -f zentao-compose.yml -p zentao up -d
