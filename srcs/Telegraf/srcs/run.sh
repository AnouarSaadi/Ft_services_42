#!/bin/sh

echo "$MINIKUBE_IP"

URL=$MINIKUBE_IP

sed -ir "s/CLUSTER_URL/$URL/g" /etc/telegraf.conf

# sed -i "s/CLUSTER_URL/$MINIKUBE_IP/g" /etc/telegraf.conf

# telegraf -config /etc/telegraf.conf

sh
