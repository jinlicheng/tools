#!/usr/bin/env bash

docker rm -f rabbitmq

docker run -d --name rabbitmq --hostname my-rabbit \
	-p 5671:5671 -p 5672:5672 -p 4369:4369 -p 25672:25672 -p 15671:15671 -p 15672:15672 \
	-e RABBITMQ_ERLANG_COOKIE='password' \
   	rabbitmq:3.8.5-management-alpine
