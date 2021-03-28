#!/bin/sh
openrc
touch /run/openrc/softlevel
rc-service nginx start
sh
