#!/usr/bin/env bash

docker-compose -f swagger.yml -p swagger up -d
#docker-compose -f sonarqube.yaml -p sonar down
