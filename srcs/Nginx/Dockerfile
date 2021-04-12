# Base Image
FROM    alpine:3.6

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
    COPY    index.html /www/html/
    #
    RUN     mkdir /run/nginx
	COPY	nginx-service.sh /
	RUN		chmod +x /nginx-service.sh

# Configuration ssl
    RUN     apk add openssl
    # RUN     openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=s/O=a Inc./CN=a" -addext "subjectAltName=DNS:a" \
    #         -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
    #         -out /etc/ssl/certs/nginx-selfsigned.crt >/dev/null 2>&1

    RUN     printf 'MA\nKHOURIBGA\nKHOURIBGA\n1337\n1337Ltd\nAnouar SAADI\nasaadi@student.1337.ma\n' | \
            openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt
    
    ENTRYPOINT ["/bin/sh", "-c", "/nginx-service.sh"]
