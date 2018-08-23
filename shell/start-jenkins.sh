#!/bin/bash

docker run -d --name myjenkins -p 8080:8080 -p 50000:50000 -v /docker_data/jenkins_home jenkins/jenkins:2.60.3
