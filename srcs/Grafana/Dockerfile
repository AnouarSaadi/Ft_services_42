FROM    alpine:3.12

LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update
RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN     apk add grafana
ENV     GRAFANA_HOME=/usr/share/grafana
RUN     mkdir -p $GRAFANA_HOME/plugins $GRAFANA_HOME/data $GRAFANA_HOME/logs $GRAFANA_HOME/dashboards &&\
        grafana-cli plugins update-all &&\
        chown -R grafana:grafana $GRAFANA_HOME
        
RUN     apk add telegraf
COPY    srcs/telgraf.conf /etc/

COPY    srcs/run.sh /
RUN     chmod +x /run.sh
EXPOSE  3000

ENTRYPOINT      [ "/run.sh" ]