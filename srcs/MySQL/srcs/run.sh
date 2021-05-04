#!/bin/sh

# Databases Creating
openrc 2> /dev/null || true ; touch /run/openrc/softlevel; \
    /etc/init.d/mariadb setup 2> /dev/null || true; \
    service mariadb start 2> /dev/null || true; \
    mysql -u root -e "CREATE DATABASE phpmyadmin";\
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'pmauser'@'%' IDENTIFIED BY 'pmapass';";\
    mysql -u root -e "FLUSH PRIVILEGES";\
    mysql -u root -e "CREATE DATABASE wordpress";\
    mysql -u root -e "CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wppass';";\
    mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';";\
    mysql -u root -e "FLUSH PRIVILEGES";
service mariadb start 2> /dev/null || true

# Add WordPress database table
mysql -u root -e "USE wordpress; SOURCE /wordpress.sql;"

# Run telegraf in background
telegraf -config /etc/telegraf.conf

# Run MySQl in foreground mode
mysqld -u root

