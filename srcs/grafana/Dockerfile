FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.0.1.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.0.1.linux-amd64.tar.gz \
&& rm grafana-7.0.1.linux-amd64.tar.gz

COPY ./defaults.ini /grafana-7.0.1/conf
# COPY ./grafana.db ./grafana-7.0.1/data/

COPY grafana.sh /usr/local/bin/
COPY ./datas/telegraf_rs.yaml /grafana-7.0.1/conf/provisioning/datasources/
COPY ./datas/docker_dash.yaml /grafana-7.0.1/conf/provisioning/dashboards/
COPY ./datas/dashboard_per_pod.json /grafana-7.0.1/data/
# COPY ./datas/docker_monitoring.json /grafana-7.0.1/data/

RUN chmod +x /usr/local/bin/grafana.sh

EXPOSE 3000

ENTRYPOINT ["grafana.sh"]
