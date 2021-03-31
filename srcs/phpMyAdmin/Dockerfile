FROM alpine:latest

RUN     apk update
RUN     apk add nginx
RUN     apk add --no-cache openrc
RUN     adduser -D -g 'www' www
RUN     mkdir /www
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /www
RUN     rm /etc/nginx/nginx.conf
COPY    nginx.conf /etc/nginx/
RUN     mkdir /run/nginx

RUN     apk add php7-fpm
RUN     apk add phpmyadmin
RUN     chmod -R 777 /usr/share/webapps/
RUN     mkdir -p /var/www/localhost/htdocs/phpmyadmin
RUN     ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
COPY    phpmyadmin-service.sh /

ENTRYPOINT ["/bin/sh", "-c", "/phpmyadmin-service.sh"]