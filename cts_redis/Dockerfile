FROM redis:8.0.2-alpine3.21

RUN apk update && \
    apk upgrade

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN apk add --no-cache su-exec

# RUN rm /usr/local/bin/gosu
