FROM    alpine:3.12
LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update

RUN     apk add mysql mysql-client; \
        apk add openrc
COPY    srcs/wordpress.sql /

COPY    srcs/mariadb-server.cnf /etc/my.cnf.d/

RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
        apk add telegraf
COPY    srcs/telegraf.conf /etc/

COPY    srcs/*.sh /
RUN     chmod +x /*.sh


EXPOSE  3306

ENTRYPOINT [ "/run.sh" ]