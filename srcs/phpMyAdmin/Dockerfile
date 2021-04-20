FROM alpine:3.12

RUN     apk update
RUN     apk add nginx
RUN     apk add openrc

RUN     mkdir /www
RUN     chown -R nginx:nginx /var/lib/nginx
RUN     chown -R nginx:nginx /www
RUN     rm /etc/nginx/nginx.conf
COPY    srcs/nginx.conf /etc/nginx/
RUN     mkdir /run/nginx

RUN     apk add php7-fpm
RUN     apk add phpmyadmin 2> /dev/null || true
RUN     chmod -R 777 /usr/share/webapps/
RUN     mkdir -p /var/www/localhost/htdocs/phpmyadmin
COPY    srcs/config.inc.php /usr/share/webapps/phpmyadmin
RUN     chmod 644 /usr/share/webapps/phpmyadmin/config.inc.php
RUN     ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin

COPY    srcs/run.sh /
RUN     chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "-c", "/run.sh"]