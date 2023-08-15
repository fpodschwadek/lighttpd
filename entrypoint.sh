#!/bin/bash
tail -f /var/log/lighttpd/error.log &
lighttpd -D -f /etc/lighttpd/lighttpd.conf
