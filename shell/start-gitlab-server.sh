sudo docker run --detach \
    --hostname 42.62.51.56 \
    --publish 3443:443 --publish 3080:80 --publish 30022:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:11.0.3-ce.0
