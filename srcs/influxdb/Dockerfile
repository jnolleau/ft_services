FROM alpine:latest

# Installation
RUN apk update \
&& apk add openrc influxdb --no-cache
# && addgroup mysql mysql
RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb
RUN chown influxdb:influxdb /etc/influxdb/
RUN chown influxdb:influxdb /var/lib/influxdb

# Copy init files
# COPY wordpress.sql /tmp/
COPY idb.sh /usr/local/bin/
# COPY influx_db-init.iql /tmp/
COPY influxdb.conf /etc/influxdb/influxdb.conf
COPY influxdb.conf /etc/influxdb.conf

RUN /usr/local/bin/idb.sh && rm /usr/local/bin/idb.sh

# VOLUME ["/var/lib/mysql"]

EXPOSE 8086

ENTRYPOINT influxd
