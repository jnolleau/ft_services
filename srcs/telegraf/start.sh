#!bin/sh
openrc default &> /dev/null
syslogd
rc-service grafana start -D &> /dev/null
tail -f /dev/null