#!/bin/bash

sudo mkdir -p /srv/nexus-data && sudo chmod -R 200 /srv/nexus-data

docker run -d -p 8081:8081 --name nexus -v /srv/nexus-data:/nexus-data sonatype/nexus3:3.27.0
