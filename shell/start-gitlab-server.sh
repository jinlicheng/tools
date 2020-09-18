#!/bin/bash

sudo docker run --detach \
    --hostname 10.20.1.7 \
    --publish 3443:443 --publish 3080:80 --publish 30022:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:11.0.3-ce.0

echo "modify /srv/gitlab/config/gitlab.rb"
echo "external_url 'http://192.168.2.102:82'"
echo "nginx['listen_port'] = 82"
echo "gitlab_rails['gitlab_shell_ssh_port'] = 2222"

