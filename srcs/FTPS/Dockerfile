FROM    alpine:3.12

LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update
    #FTP Server
RUN     apk add vsftpd 

    # Getting vsftpd config
COPY    srcs/vsftpd.conf /etc/vsftpd/

    # SSl Creating
RUN     apk add openssl
RUN     printf 'MA\nKHOURIBGA\nKHOURIBGA\n1337FIL\n1337Ltd\nAnouar SAADI\nasaadi@student.1337.ma\n'| \
        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key \
        -out /etc/ssl/certs/vsftpd.crt 2> /dev/null || true

RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
        apk add telegraf
COPY    srcs/telegraf.conf /etc/

COPY    srcs/*.sh /
RUN     chmod +x /*.sh

ENTRYPOINT [ "/run.sh" ]