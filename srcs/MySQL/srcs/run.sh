#!bin/sh

openrc 2> /dev/null || true
touch /run/openrc/softlevel
mysqld -u root 2> /dev/null || true