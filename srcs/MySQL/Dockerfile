FROM    alpine:3.12
LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update
RUN     apk add mysql mysql-client
RUN     apk add openrc ; openrc 2> /dev/null || true ; touch /run/openrc/softlevel
RUN     /etc/init.d/mariadb setup 2> /dev/null || true

# phpmyadmin database creating
RUN     service mariadb start 2> /dev/null || true; \
        mysql -u root -e "CREATE DATABASE phpmyadmin";\
        mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'pmauser'@'%' IDENTIFIED BY 'pmapass';";\
        mysql -u root -e "FLUSH PRIVILEGES";

# wordpress database creating
RUN     service mariadb restart 2> /dev/null || true; \
        mysql -u root -e "CREATE DATABASE wordpress";\
        mysql -u root -e "CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wppass';";\
        mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';";\
        mysql -u root -e "FLUSH PRIVILEGES";

COPY    srcs/mariadb-server.cnf /etc/my.cnf.d/

RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
        apk add telegraf
COPY    srcs/telgraf.conf /etc/

COPY    srcs/run.sh /
RUN     chmod +x /run.sh

EXPOSE  3306

ENTRYPOINT [ "/run.sh" ]