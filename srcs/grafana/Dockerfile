FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-6.7.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-6.7.3.linux-amd64.tar.gz \
&& rm grafana-6.7.3.linux-amd64.tar.gz
# && rm /grafana-6.7.3/conf/defaults.ini \

# COPY ./defaults.ini ./grafana-6.6.0/conf/
# COPY ./grafana.db ./grafana-6.6.0/data/

COPY grafana.sh /usr/local/bin/
COPY grafana.db /grafana-6.7.3/data/

RUN chmod +x /usr/local/bin/grafana.sh

EXPOSE 3000

ENTRYPOINT ["grafana.sh"]
