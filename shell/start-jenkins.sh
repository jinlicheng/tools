#!/bin/bash

#docker run -d --name myjenkins -p 8080:8080 -p 50000:50000 -v /docker_data/jenkins_home jenkins/jenkins:2.60.3

docker run --name jenkins -d -u root -p 8080:8080 -p 50000:50000 -v /Users/kelvin/Workspaces/docker-volumes/jendkins_data:/var/jenkins_home jenkinsci/blueocean
