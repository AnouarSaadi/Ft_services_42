FROM    alpine:3.12

RUN     apk update

RUN     apk add influxdb

RUN     apk add curl wget gnupg
RUN     curl -s https://repos.influxdata.com/influxdb.key | gpg --import
RUN     wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.5_linux_amd64.tar.gz.asc
RUN     wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.5_linux_amd64.tar.gz
RUN     influxd -config /etc/influxdb.conf
ENV     INFLUXDB_CONFIG_PATH=/etc/influxdb.conf
RUN     influxd