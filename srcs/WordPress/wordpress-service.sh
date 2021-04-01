#!/bin/sh

openrc
touch /run/openrc/softlevel
service nginx start
service php-fpm7 start
# service nginx start
sh