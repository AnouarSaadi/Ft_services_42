#!/bin/sh

if pgrep telegraf >/dev/null 2>&1;
then
    echo "Telegraf is up...";
else
    echo "Telegraf is down!";
    exit 1;
    # telegraf -config /etc/telegraf.conf &
fi

if pgrep nginx >/dev/null 2>&1;
then
    echo "nginx is up...";
else
    echo "nginx is down!";
    exit 1;
    # service nginx restart 2> /dev/null || true
fi