FROM alpine:3.22

RUN apk add --no-cache ca-certificates && \
    adduser -D -u 1000 -h /data storo

COPY storo /usr/bin/storo
COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN chmod +x /usr/bin/docker-entrypoint.sh && mkdir -p /data && chown storo /data

USER storo
WORKDIR /data

EXPOSE 9000 9001

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

VOLUME ["/data"]

CMD ["server", "/data"]
