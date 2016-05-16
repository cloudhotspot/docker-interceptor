FROM alpine
MAINTAINER Justin Menga <justin.menga@yellow.co.nz>

RUN apk update && \
    apk add --no-cache bash squid ca-certificates openssl tcpdump && \
    rm -rf /root/.cache

COPY files/* /etc/squid/

ENTRYPOINT squid -f /etc/squid/squid.conf -NYCd 1