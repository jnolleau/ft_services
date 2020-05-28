FROM alpine:latest

RUN apk update && apk add --no-cache libc6-compat

# RUN mkdir /etc/telegraf
# RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.2_linux_amd64.tar.gz
# RUN tar xf telegraf-1.14.2_linux_amd64.tar.gz \
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.3_linux_amd64.tar.gz
RUN tar xf telegraf-1.14.3_linux_amd64.tar.gz && rm -rf *.tar.gz
# && tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz \
# && chmod +x telegraf/* \

COPY telegraf.sh /usr/local/bin/
COPY telegraf.conf /telegraf/etc/telegraf/telegraf.conf

RUN chmod +x /usr/local/bin/telegraf.sh
RUN chmod +x ./telegraf/usr/bin/telegraf

# VOLUME ["/var/run/docker.sock"]

# EXPOSE 4999

ENTRYPOINT ["telegraf.sh"]
