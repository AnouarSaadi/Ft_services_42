FROM        alpine:3.12
LABEL       Author "asaadi <asaadi@student.1337.ma>"

RUN         apk update
RUN         apk add influxdb
# COPY        srcs/influxdb.conf /etc/

RUN         echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
            apk add telegraf
COPY        srcs/telegraf.conf /etc/

COPY        srcs/*.sh /
RUN         chmod +x /*.sh

EXPOSE      8086

ENTRYPOINT  [ "/run.sh" ]