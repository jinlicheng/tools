#!/bin/bash

export GITLAB_HOME=$HOME/Workspaces/docker-volumes/gitlab

sudo docker run --detach \
    --hostname 192.168.56.1 \
    --publish 3443:443 --publish 3080:80 --publish 30022:22 \
    --name gitlab \
    --volume $GITLAB_HOME/config:/etc/gitlab \
    --volume $GITLAB_HOME/logs:/var/log/gitlab \
    --volume $GITLAB_HOME/data:/var/opt/gitlab \
    gitlab/gitlab-ce:14.4.4-ce.0

echo "# modify /srv/gitlab/config/gitlab.rb"
echo "external_url 'http://192.168.56.1:3080'"
echo "nginx['listen_port'] = 3080"
echo "gitlab_rails['gitlab_shell_ssh_port'] = 30022"

