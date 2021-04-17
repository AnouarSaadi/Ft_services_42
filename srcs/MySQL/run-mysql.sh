#!bin/sh

openrc
touch /run/openrc/softlevel
service mariadb restart
sh