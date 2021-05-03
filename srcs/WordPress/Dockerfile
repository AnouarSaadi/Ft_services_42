FROM    alpine:3.12
LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update
RUN     apk add nginx
RUN     apk add openrc
RUN     mkdir /www
RUN     chown -R nginx:nginx /var/lib/nginx
RUN     chown -R nginx:nginx /www
RUN     rm /etc/nginx/nginx.conf
COPY    srcs/nginx.conf /etc/nginx/
RUN     mkdir /run/nginx

RUN     apk add php7-fpm php7-openssl php7-json php7-mysqli
RUN     mkdir -p /usr/share/webapps
RUN     cd /usr/share/webapps ; wget http://wordpress.org/latest.tar.gz; \
        tar -xzvf latest.tar.gz ; rm latest.tar.gz ; cd /
RUN     chown -R 777 /usr/share/webapps
RUN     rm /usr/share/webapps/wordpress/wp-config-sample.php
COPY    srcs/wp-config.php /usr/share/webapps/wordpress/
RUN     ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
        apk add telegraf
COPY    srcs/telegraf.conf /etc/

COPY    srcs/*.sh /
RUN     chmod +x /*.sh

EXPOSE  5050

ENTRYPOINT [ "/run.sh" ]