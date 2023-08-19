#!/bin/bash

# If the log folder is mounted from the host, it might initially have a
# different owner than www-data.
chown -R www-data:www-data /var/log/lighttpd

# Display error log entries via Docker.
tail -f /var/log/lighttpd/error.log &

# Start server.
lighttpd -D -f /etc/lighttpd/lighttpd.conf
