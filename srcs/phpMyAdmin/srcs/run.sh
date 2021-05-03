#!/bin/sh

telegraf -config /etc/telegraf.conf &

openrc 2> /dev/null || true
touch /run/openrc/softlevel 2> /dev/null || true
service php-fpm7 start 2> /dev/null || true
service nginx start 2> /dev/null || true

