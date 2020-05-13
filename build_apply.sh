#!/bin/bash

# List of the services, comment the ones you don't want to run
services=('nginx' 'influxdb' 'telegraf'	'grafana' 'ftps')
	# 'wordpress'	\
	# 'mysql'		\
	# 'phpmyadmin'	\
srcs='./srcs'

	# Build images and deploy all services
	for service in "${services[@]}"
	do
		# Build Docker images
		# docker build -t ${service}_img $srcs/$service
		# Deployment
		kubectl apply -f $srcs/$service.yaml
	done