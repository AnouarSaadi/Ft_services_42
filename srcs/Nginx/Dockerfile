# Base Image
FROM    alpine:latest

#Installation
    # Updating APK Packages
    RUN     apk update

    # Installing Nginx Package
    RUN     apk add nginx

    # Installing OpenRC
    RUN     apk add --no-cache openrc

    # Creating new user and group for nginx
    RUN     adduser -D -g 'www' www
    # Creating directory for html files
    RUN     mkdir /www
    RUN     chown -R www:www /var/lib/nginx
    RUN     chown -R www:www /www

# Configuration
    # Configuration Nginx to listen to port 80 and process .html and .htm
    RUN     rm /etc/nginx/nginx.conf
    COPY    nginx.conf /etc/nginx/

    #
    RUN     mkdir /run/nginx
	COPY	nginx-service.sh /
	RUN		chmod +x /nginx-service.sh

    ENTRYPOINT ["/bin/sh", "-c", "/nginx-service.sh"]
