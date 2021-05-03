FROM    alpine:3.12

LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update
RUN     echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN     apk add grafana
ENV     GRAFANA_HOME=/usr/share/grafana
RUN     mkdir -p $GRAFANA_HOME/plugins $GRAFANA_HOME/data $GRAFANA_HOME/logs $GRAFANA_HOME/dashboards &&\
        grafana-cli plugins update-all &&\
        chown -R grafana:grafana $GRAFANA_HOME
COPY    srcs/sample.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY    srcs/grafana.db /usr/share/grafana/data/
        
RUN     apk add telegraf
COPY    srcs/telegraf.conf /etc/

COPY    srcs/*.sh /
RUN     chmod +x /*.sh
EXPOSE  3000

ENTRYPOINT      [ "/run.sh" ]