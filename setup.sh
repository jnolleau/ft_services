#!/bin/bash

######################### CONFIGURATION #########################

# List of the services, comment the ones you don't want to run
services=(		\
	mysql		\
	wordpress	\
	phpmyadmin	\
	nginx		\
	ftps		\
	influxdb	\
	telegraf	\
	grafana		\
)

# Images source directory
srcs='./srcs'

# User
if [ -z "${USER}" ]
then
  user="admin"
else
  user=$USER
fi

# Passwords wherever it is needed
password='pw'


####################### END CONFIGURATION #######################
# Do not edit from here


if [ $# -ge 1 ] && [ $1 = 'stop' ]
then
	# Purge Minikube
	# eval $(minikube docker-env -u)
	minikube stop
	minikube delete --all
else

	# Launch Minikube ans install addons
	minikube start --cpus=8 --memory=4096 --driver=docker
	minikube addons enable dashboard
	minikube addons enable ingress
	minikube addons enable metrics-server
	
	# Collect minikube ip
	minikube_ip=`minikube ip`

	#Create config file from templates
	mv $srcs/config_map.yaml.bak $srcs/config_map.yaml
	
	sed -i.bak "s/{{USER}}/$user/g; \
				s/{{MINIKUBE_IP}}/$minikube_ip/g; \
				s/{{PW}}/`echo $password | base64`/g" $srcs/config_map.yaml
	
	sleep 4

	# Set the environment variable to use local Docker
	eval $(minikube docker-env)


	# Build images
	for service in "${services[@]}"
	do
		# Build Docker images
		echo "Building ${service}_img ..."
		docker build -t ${service}_img $srcs/$service > /dev/null
		echo "${service}_img built"
	done

	# Create the ConfigMap containing environment var for containers
	kubectl apply -f $srcs/config_map.yaml
	# Create peristent volumes
	kubectl apply -f $srcs/volumes.yaml
	
	# Deploy all services
	# for service in "${services[@]}"
	# do
	# 	kubectl apply -f $srcs/$service.yaml
	# done

	kubectl apply -k $srcs/
	
	# Create ingress for nginx
	kubectl apply -f $srcs/ingress.yaml

	sleep 5

	echo "======================================"
	echo "========== Cluster Settings =========="
	echo "======================================"
	echo "MINIKUBE_IP: $minikube_ip"
	# echo "Nginx HTTP URL: `minikube service nginx --url | grep '80'`"
	# echo "Nginx HTTPS URL: `minikube service nginx --url --https | grep '443'`"
	echo "Nginx HTTP URL: http://$minikube_ip"
	echo "Nginx HTTPS URL: https://$minikube_ip"
	echo "Grafana URL: http://$minikube_ip/grafana/"
	echo "Wordpress URL: http://$minikube_ip/wordpress/"
	echo "PhpMyAdmin URL: http://$minikube_ip/phpmyadmin/"
	# echo "Influxdb URL: `minikube service influxdb --url`"
	echo "FTP URL: ftp://$minikube_ip - Port 30021"
	echo "Connect Nginx by SSH: ssh $user@$minikube_ip -p 2022"
fi
