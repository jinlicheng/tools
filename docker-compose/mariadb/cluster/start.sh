#!/usr/bin/env bash

docker-compose -f mysql-cluster-compose.yml -p mariadb-cluster-mm up -d

#docker-compose -f mysql-cluster-compose.yml -p mariadb-cluster-mm down
#docker-compose -f mysql-cluster-compose.yml -p mariadb-cluster-mm stop
#docker-compose -f mysql-cluster-compose.yml -p mariadb-cluster-mm start
