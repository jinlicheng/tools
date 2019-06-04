#!/usr/bin/env bash

docker-compose -f sonarqube.yaml -p sonar up -d
#docker-compose -f sonarqube.yaml -p sonar down
