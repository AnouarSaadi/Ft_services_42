#!/bin/sh

if pgrep telegraf >/dev/null 2>&1;
then
    echo "Telegraf is up...";
else
    echo "Telegraf is down!\nExit";
    exit 1;
    # telegraf -config /etc/telegraf.conf &
fi
if pgrep grafana-server >/dev/null 2>&1;
then
    echo "grafana is up...";
else
    echo "grafna is down!\nExit"
    exit 1;
    # grafana-server -homepath $GRAFANA_HOME
fi