# docker build -t lighttpd-docker-service .
FROM debian:bookworm-slim

# Install lighttpd
RUN apt update; \
    apt install -y \
       lighttpd \
    ; \
    rm -rf /var/lib/apt/lists/*; \

    # Create log files and set permissions.
    mkdir -p /var/log/lighttpd; \
    chown -R www-data:www-data /var/log/lighttpd

# Add entrypoint script.
COPY ./entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT /bin/bash entrypoint
