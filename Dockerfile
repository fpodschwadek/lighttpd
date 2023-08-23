# The available image was built with:
#
# docker buildx build --platform=linux/amd64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7 -t fpod/lighttpd-docker-service .
#
# If you want to build for a different architecture, you'll have to modifiy the command accordingly (or just use docker build).
FROM debian:bookworm-slim

# Install lighttpd
RUN apt update; \
    apt install -y \
       lighttpd \
    ; \
    rm -rf /var/lib/apt/lists/*; \

    # Create log files and set permissions.
    mkdir -p /var/log/lighttpd; \
    touch /var/log/lighttpd/error.log; \
    touch /var/log/lighttpd/access.log; \
    chown -R www-data:www-data /var/log/lighttpd; \

    # Remove default enabled config, which is only re-defining allowed
    # index file names.
    rm /etc/lighttpd/conf-enabled/99-unconfigured.conf

# Add entrypoint script.
COPY ./entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["/bin/bash", "-c",  "entrypoint"]
