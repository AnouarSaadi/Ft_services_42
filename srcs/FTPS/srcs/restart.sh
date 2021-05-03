#!/bin/sh

if pgrep telegraf >/dev/null 2>&1;
then
    echo "Telegraf is up...";
else
    echo "Telegraf is down!\nExit";
    exit 1;
fi
if pgrep [vsftpd] >/dev/null 2>&1;
then
    echo "vsftpd is up...";
else
    echo "vsftpd is down!\nExit"
    exit 1;
fi