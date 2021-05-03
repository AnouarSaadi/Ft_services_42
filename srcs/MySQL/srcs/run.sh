#!/bin/sh

# Add WordPress database table
openrc 2> /dev/null || true
service mariadb start 2> /dev/null || true
mysql -u root -e "USE wordpress; SOURCE /wordpress.sql;"

# Run telegraf in background
telegraf -config /etc/telegraf.conf

# Run MySQl in foreground mode
mysqld -u root 2> /dev/null || true

