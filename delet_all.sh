#!/bin/bash

# List of the services, comment the ones you don't want to run
services=('nginx' 'influxdb' 'telegraf'	'grafana' 'ftps' 'wordpress' 'mysql' 'phpmyadmin')
srcs='./srcs'

	kubectl delete -f ./srcs/config_map.yaml

	# kubectl delete -f ./srcs/volumes.yaml

	# Build images and deploy all services
	for service in "${services[@]}"
	do
		# Delete
		kubectl delete -f $srcs/$service.yaml
	done
		# kubectl delete pv --all