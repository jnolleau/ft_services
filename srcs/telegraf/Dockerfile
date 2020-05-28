FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.14.3_linux_amd64.tar.gz && rm -rf *.tar.gz

COPY telegraf.sh /usr/local/bin/
COPY telegraf.conf /telegraf/etc/telegraf/telegraf.conf

RUN chmod +x /usr/local/bin/telegraf.sh
RUN chmod +x ./telegraf/usr/bin/telegraf

ENTRYPOINT ["telegraf.sh"]
