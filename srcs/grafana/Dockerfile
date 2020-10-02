FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.2.0.linux-amd64.tar.gz \
&& rm grafana-7.2.0.linux-amd64.tar.gz

COPY ./defaults.ini /grafana-7.2.0/conf

COPY grafana.sh /usr/local/bin/
COPY ./datas/telegraf_rs.yaml /grafana-7.2.0/conf/provisioning/datasources/
COPY ./datas/docker_dash.yaml /grafana-7.2.0/conf/provisioning/dashboards/
COPY ./datas/dashboard_per_pod.json /grafana-7.2.0/data/

RUN chmod +x /usr/local/bin/grafana.sh

EXPOSE 3000

ENTRYPOINT ["grafana.sh"]
