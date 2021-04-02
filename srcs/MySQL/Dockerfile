FROM alpine:latest

RUN     apk update
RUN     apk add mysql mysql-client
RUN     /etc/init.d/mariadb setup

# phpmyadmin database creating
RUN     service mariadb start; \
        mysql -u root -e "CREATE DATABASE phpmyadmin";\
        mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost' IDENTIFIED BY 'phpmyadmin';";\
        mysql -u root -e "FLUSH PRIVILEGES";

# wordpress database creating
RUN     service mariadb start; \
        mysql -u root -e "CREATE DATABASE wordpress";\
        mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';";\
        mysql -u root -e "FLUSH PRIVILEGES";