#!/bin/sh

if [ -e /var/run/docker.sock ]
	then 
		chmod 666 docker.sock
		chown root:root /var/run/docker.sock
fi
cd /telegraf/usr/bin && ./telegraf --config "/telegraf/etc/telegraf/telegraf.conf"
# openrc default
# rc-update add telegraf default
# rc-service telegraf start 2> /dev/NULL
# /bin/sh