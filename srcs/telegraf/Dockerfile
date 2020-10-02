FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.15.3_linux_amd64.tar.gz && rm -rf *.tar.gz

COPY telegraf.sh /usr/local/bin/
COPY telegraf.conf /telegraf-1.15.3/etc/telegraf/telegraf.conf

RUN chmod +x /usr/local/bin/telegraf.sh
RUN chmod +x ./telegraf-1.15.3/usr/bin/telegraf

ENTRYPOINT ["telegraf.sh"]
