#!/usr/bin/env bash

docker-compose -f redis.yaml -p redis-cluster up -d
#docker-compose -f redis.yaml -p redis-cluster down
