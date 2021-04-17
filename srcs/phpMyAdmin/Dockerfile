FROM alpine:3.12

RUN     apk update
RUN     apk add nginx
RUN     apk add openrc

RUN     mkdir /www
RUN     chown -R nginx:nginx /var/lib/nginx
RUN     chown -R nginx:nginx /www
RUN     rm /etc/nginx/nginx.conf
COPY    nginx.conf /etc/nginx/
RUN     mkdir /run/nginx

RUN     apk add php7-fpm
RUN     apk add phpmyadmin
RUN     chmod -R 777 /usr/share/webapps/
RUN     mkdir -p /var/www/localhost/htdocs/phpmyadmin
RUN     ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
COPY    run-phpmyadmin.sh /
RUN     chmod +x /run-phpmyadmin.sh

ENTRYPOINT ["/bin/sh", "-c", "/run-phpmyadmin.sh"]