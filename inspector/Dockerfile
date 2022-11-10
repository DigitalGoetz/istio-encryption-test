FROM ubuntu:kinetic

RUN apt-get update -y && apt-get install -y net-tools dnsutils tcpdump curl wget jq

WORKDIR /application
COPY ./inspector/* /application/

USER root

CMD ["bash", "-c", "/application/forever.sh"]