#!/bin/bash

srcs='./srcs'
services=('nginx' 'influxdb' 'telegraf'	'grafana' 'ftps' \
	'wordpress' 'mysql' 'phpmyadmin' 'ingress' 'volumes')

if [ $# -ge 1 ] && [[ " ${services[@]} " =~ " $1 " ]];
then
	kubectl delete -f $srcs/$1.yaml
	kubectl apply -f $srcs/$1.yaml
else
	echo "The svc \"$1\" doesn't exist"
fi

if [ $# -eq 2 ] && [ $1 = '-b' ] && [[ " ${services[@]} " =~ " $2 " ]];
then
	docker build -t ${2}_img $srcs/$2
	kubectl delete -f $srcs/$2.yaml
	kubectl apply -f $srcs/$2.yaml
elif [ $# -eq 2 ] && [[ " ${services[@]} " =~ " $1 " ]] && [ $2 = '-b' ];
then
	docker build -t ${1}_img $srcs/$1
	kubectl delete -f $srcs/$1.yaml
	kubectl apply -f $srcs/$1.yaml
fi
