#!/bin/sh

if pgrep telegraf >/dev/null 2>&1;
then
    echo "Telegraf is up...";
else
    echo "Telegraf is down!";
    exit 1;
fi
if pgrep mysql >/dev/null 2>&1;
then
    echo "mysql is up...";
else
    echo "mysql is down!";
    exit 1;
fi