#!/bin/sh

openrc default
rc-update add influxdb default
# rc-service influxdb start 2> /dev/NULL
# sleep 5
# influx -execute "CREATE DATABASE telegraf"
# influx -execute "CREATE USER $USER WITH PASSWORD 'pw'"
# influx -execute "GRANT ALL ON telegraf TO $USER"
# influx -execute "CREATE RETENTION POLICY one_week ON telegraf DURATION 168h REPLICATION 1 DEFAULT"
# influx -execute "SHOW DATABASES"
# /bin/sh
# sed -i 's/skip-networking/skip-networking = false/g' /etc/my.cnf.d/influxdb-server.cnf

# echo "Starting Mysql..."
# chown -R mysql:mysql /var/lib/mysql
# /etc/init.d/influxdb setup