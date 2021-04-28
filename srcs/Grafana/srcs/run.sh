#!/bin/sh

grafana-server -homepath $GRAFANA_HOME

telegraf -config /etc/telegraf.conf
