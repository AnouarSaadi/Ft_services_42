#!/bin/sh

openrc 2> /dev/null || true
touch /run/openrc/softlevel 2> /dev/null
telegraf -config /etc/telegraf.conf &
service nginx start 2> /dev/null || true
