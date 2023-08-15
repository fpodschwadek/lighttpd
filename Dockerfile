# docker build -t lighttpd-docker-service .
FROM debian:bookworm-slim

# Install lighttpd
RUN apt update; \
    apt install -y \
       lighttpd; \
    rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh; \
    touch /var/log/lighttpd/error.log; \
    chown www-data:www-data /var/log/lighttpd/error.log

ENTRYPOINT /bin/bash /entrypoint.sh

