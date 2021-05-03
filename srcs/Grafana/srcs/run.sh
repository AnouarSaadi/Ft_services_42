#!/bin/sh

telegraf -config /etc/telegraf.conf &
grafana-server -homepath $GRAFANA_HOME