FROM alpine:3.12

RUN     apk update
RUN     apk add mysql mysql-client
RUN     apk add openrc ; openrc ; touch /run/openrc/softlevel
RUN     /etc/init.d/mariadb setup

# phpmyadmin database creating
RUN     service mariadb restart; \
        mysql -u root -e "CREATE DATABASE phpmyadmin";\
        mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'pmauser'@'%' IDENTIFIED BY 'pmapass';";\
        mysql -u root -e "FLUSH PRIVILEGES";

# wordpress database creating
RUN     service mariadb restart; \
        mysql -u root -e "CREATE DATABASE wordpress";\
        mysql -u root -e "CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wppass';";\
        mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';";\
        mysql -u root -e "FLUSH PRIVILEGES";
COPY    mariadb-server.cnf /etc/my.cnf.d/
COPY    run-mysql.sh /
RUN     chmod +x /run-mysql.sh

ENTRYPOINT [ "/bin/sh", "-c", "/run-mysql.sh"]