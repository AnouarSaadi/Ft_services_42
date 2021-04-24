FROM        alpine:3.12
LABEL       Author "asaadi <asaadi@student.1337.ma>"

RUN         apk update
RUN         apk add influxdb
COPY        srcs/influxdb.conf /etc/
COPY        srcs/run.sh /
RUN         chmod +x /run.sh

EXPOSE      8086

ENTRYPOINT  [ "/bin/sh", "-c", "/run.sh" ]