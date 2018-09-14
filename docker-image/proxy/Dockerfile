#FROM alpine:edge
FROM python:2.7.15-alpine3.8

RUN apk update 
#RUN apk add python python-pip python-setuptools m2crypto polipo
RUN apk add polipo

RUN export LC_ALL="C"
RUN pip install shadowsocks
RUN mkdir -p /etc/shadowsocks

EXPOSE 1080
CMD ["/usr/local/bin/sslocal", "-c", "/etc/shadowsocks/config.json", "start"]
