#!/bin/sh

# if [ -e /var/run/docker.sock ]
# 	then 
# 		chmod 666 docker.sock
# 		chown root:root /var/run/docker.sock
# fi
cd /telegraf-1.15.3/usr/bin && ./telegraf --config "/telegraf-1.15.3/etc/telegraf/telegraf.conf"
# tail -f /dev/null