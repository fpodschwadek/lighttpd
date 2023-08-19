#!/bin/bash

log_path="/var/log/lighttpd"
log_file="error.log"

# Make a log file if it does not exist. This way we can tail it right from
# the start and catch the startup message for output.
if [ ! -e $log_path/$log_file ]; then
    touch $log_path/$log_file
fi

# If an existing log folder is mounted from the host, it might initially have a
# different owner than www-data. Let's fix this.
chown -R www-data:www-data $log_path

# Display error log entries via Docker.
tail -f $log_path/$log_file &

# Start server.
lighttpd -D -f /etc/lighttpd/lighttpd.conf


