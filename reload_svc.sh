#!/bin/bash

srcs='./srcs'
services=('nginx' 'influxdb' 'telegraf'	'grafana' 'ftps' \
	'wordpress' 'mysql' 'phpmyadmin' 'ingress')

if [ $# -ge 1 ] && [[ " ${services[@]} " =~ " $1 " ]];
then
	kubectl delete -f $srcs/$1.yaml
	kubectl apply -f $srcs/$1.yaml
else
	echo "The svc \"$1\" doesn't exist"
fi
