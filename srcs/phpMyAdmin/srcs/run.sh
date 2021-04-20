#!/bin/sh

openrc 2> /dev/null || true
touch /run/openrc/softlevel
service php-fpm7 start 2> /dev/null || true
service nginx start 2> /dev/null || true