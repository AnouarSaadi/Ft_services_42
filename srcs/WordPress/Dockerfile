FROM    alpine:latest

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

RUN     apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp; \
        apk add php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli ; \
        apk add php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc; \
        apk add php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc; \
        apk add php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
RUN     mkdir -p /usr/share/webapps
RUN     cd /usr/share/webapps ; wget http://wordpress.org/latest.tar.gz;\
        tar -xzvf latest.tar.gz ; rm latest.tar.gz ; cd /
RUN     chown -R 777 /usr/share/webapps
RUN     ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
COPY    wordpress-service.sh /
RUN     chmod +x /wordpress-service.sh

ENTRYPOINT ["/bin/sh", "-c", "/wordpress-service.sh"]