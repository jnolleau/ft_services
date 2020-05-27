FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-6.7.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-6.7.3.linux-amd64.tar.gz \
&& rm grafana-6.7.3.linux-amd64.tar.gz

COPY ./defaults.ini /grafana-6.7.3/conf
# COPY ./grafana.db ./grafana-6.6.0/data/

COPY grafana.sh /usr/local/bin/
COPY ./datas/telegraf_rs.yaml /grafana-6.7.3/conf/provisioning/datasources/
COPY ./datas/docker_dash.yaml /grafana-6.7.3/conf/provisioning/dashboards/
COPY ./datas/docker_monitoring.json /grafana-6.7.3/data/
# COPY grafana.db /grafana-6.7.3/data/docker_dash.yaml

RUN chmod +x /usr/local/bin/grafana.sh

EXPOSE 3000

ENTRYPOINT ["grafana.sh"]
