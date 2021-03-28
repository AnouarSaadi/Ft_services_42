FROM php:7-fpm-alpine

RUN     apk update\
        apk add php7-fpm\
        apk add phpmyadmin
COPY    phpmyadmin-service.sh /
RUN     apk add --no-cache openrc


ENTRYPOINT ["/bin/sh", "-c", "/phpmyadmin-service.sh"]