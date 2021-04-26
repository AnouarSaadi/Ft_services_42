FROM    alpine:3.12

LABEL	Author "asaadi <asaadi@student.13337.ma>"

RUN		apk update
RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk add telegraf
COPY    srcs/telegraf.conf /etc/


COPY    srcs/run.sh /
RUN     chmod +x /run.sh
RUN     apk add openrc

ENTRYPOINT [ "/run.sh" ]

CMD [ "sh" ]
# EXPOSE  8094 TCP
