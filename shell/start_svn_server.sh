#!/bin/bash

docker run -d \
    --name svn-server \
    --volume /docker_data/svn:/var/opt/svn \
    --publish 3690:3690 \
    garethflowers/svn-server
