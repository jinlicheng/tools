#!/bin/bash

docker run --name mysql8 -e MYSQL_ROOT_PASSWORD=password -d mysql:8.0.17 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --default-authentication-plugin=mysql_native_password
