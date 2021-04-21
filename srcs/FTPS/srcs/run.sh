#!/bin/sh

openrc 2> /dev/null || true
touch /run/openrc/softlevel

USER="asaadi"
PASS="asaadi"

addgroup -g 433 -S $USER
adduser -u 431 -D -G $USER -h /home/$USER -s /bin/false  $USER

echo "$USER:$PASS" | chpasswd
chown $USER:$USER /home/$USER/ -R

rc-service vsftpd start 2> /dev/null || true
vsftpd
# sh