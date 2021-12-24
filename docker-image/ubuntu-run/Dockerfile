FROM ubuntu:18.04

RUN apt update \
     && apt install -y openjdk-8-jdk maven

COPY ./sleep.sh /sleep.sh

CMD ["bash", "/sleep.sh"]
