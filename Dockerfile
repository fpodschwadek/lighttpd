# docker build -t lighttpd-docker-service .
FROM debian:bookworm-slim

# Install lighttpd
RUN apt update; \
    apt install -y \
       lighttpd \
    ; \
    rm -rf /var/lib/apt/lists/*

# Create log files and set permissions.
RUN mkdir -p /var/log/lighttpd; \
    touch /var/log/lighttpd/lighttpd.{error,access}.log; \
    chown -R www-data:www-data /var/log/lighttpd

# Add entrypoint script.
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /bin/bash /entrypoint.sh
