#!/bin/sh

if pgrep telegraf >/dev/null 2>&1;
then
    echo "Telegraf is up...";
else
    echo "Telegraf is down!";
    exit 1;
fi
if pgrep php-fpm7 >/dev/null 2>&1;
then
    echo "php-fpm7 is up...";
else
    echo "php-fpm7 is down!";
    exit 1;
fi
if pgrep nginx >/dev/null 2>&1;
then
    echo "nginx is up...";
else
    echo "nginx is down!";
    exit 1;
fi