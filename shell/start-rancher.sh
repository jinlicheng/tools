#!/bin/bash

docker run -d --name rancher-server --restart=unless-stopped -p 8080:80 -p 8443:443 rancher/rancher:v2.0.4 --add-local true
