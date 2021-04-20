#!/bin/sh

openrc 2> /dev/null || true
touch /run/openrc/softlevel
service nginx start 2> /dev/null || true
