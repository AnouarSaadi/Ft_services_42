#!/bin/sh
openrc
touch /run/openrc/softlevel
rc-service php-fpm7 start
rc-service nginx start
sh