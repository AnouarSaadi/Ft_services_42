# Base Image
FROM    alpine:3.12
LABEL   Author "asaadi <asaadi@student.1337.ma>"

#Installation
    # Updating APK Packages
    RUN     apk update

    # Installing Nginx Package
    RUN     apk add nginx

    # Installing OpenRC
    RUN     apk add openrc

    # Creating directory for html files
    RUN     mkdir /www
    RUN     chown -R nginx:nginx /var/lib/nginx
    RUN     chown -R nginx:nginx /www

# # Configuration
#     # Configuration Nginx to listen to port 80 and process .html and .htm
    RUN     rm /etc/nginx/nginx.conf
    COPY    srcs/nginx.conf /etc/nginx/
    COPY    srcs/index.html /www/html/

# Configuration ssl
    RUN     apk add openssl

    RUN     printf 'MA\nKHOURIBGA\nKHOURIBGA\n1337FIL\n1337Ltd\nAnouar SAADI\nasaadi@student.1337.ma\n' | \
            openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt 2> /dev/null || true
    
    # Telegraf
    RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
    RUN     apk add telegraf
    COPY    srcs/telegraf.conf /etc/

    # Script that will execute in container at runtime.
    RUN     mkdir /run/nginx
	COPY	srcs/*.sh /
	RUN		chmod +x /*.sh

    # Specifying network ports at runtime
    EXPOSE  80
    EXPOSE  443

    ENTRYPOINT [ "/run.sh" ]
