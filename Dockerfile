FROM alpine
MAINTAINER Justin Menga <justin.menga@yellow.co.nz>

RUN echo "http://nl.alpinelinux.org/alpine/edge/main/" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache bash squid ca-certificates openssl tcpdump && \
    rm -rf /root/.cache

COPY files/* /etc/squid/

RUN /usr/lib/squid/ssl_crtd -c -s /var/lib/ssl_db -M 16MB && \
    chown -R squid:squid /var/lib/ssl_db/

ENTRYPOINT squid -f /etc/squid/squid.conf -NYCd 1