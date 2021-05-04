#!/bin/sh

if pgrep telegraf >/dev/null 2>&1;
then
    echo "Telegraf is up...";
else
    echo "Telegraf is down!";
    exit 1;
    # telegraf -config /etc/telegraf.conf &
fi
if pgrep influx >/dev/null 2>&1;
then
    echo "influxdb is up...";
else
    echo "influxdb is down!";
    exit 1;
    # influxd -config /etc/influxdb.conf
fi