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
# Checking if docker is running, starting it if not
pgrep docker &> /dev/null
if [ $? != 0 ]
then
    echo "Docker service stoped. Starting it..."
	sudo service docker start
fi
	# Launch Minikube ans install addons
	minikube start --cpus=8 --memory=4096 --driver=docker --extra-config=apiserver.service-node-port-range=10-32767
	minikube addons enable dashboard
	minikube addons enable ingress
	minikube addons enable metrics-server
	
	# Collect minikube ip
	minikube_ip=`minikube ip`
	# minikube_ip="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

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
		echo "... ${service}_img built."
	done

	# Create the ConfigMap containing environment var for containers
	kubectl apply -f $srcs/config_map.yaml
	# Create peristent volumes
	kubectl apply -f $srcs/volumes.yaml
	
	# Deploy all services
	for service in "${services[@]}"
	do
		kubectl apply -f $srcs/$service.yaml
	done

	# kubectl apply -k $srcs/
	
	# Create ingress for nginx
	kubectl apply -f $srcs/ingress.yaml

	sleep 5

	echo "======================================"
	echo "========== Cluster Settings =========="
	echo "======================================"
	echo "MINIKUBE_IP: $minikube_ip"
	echo "Nginx HTTP URL: http://$minikube_ip"
	echo "Nginx HTTPS URL: https://$minikube_ip"
	echo "Grafana URL: http://$minikube_ip:3000"
	echo "Wordpress URL: http://$minikube_ip:5050"
	echo "PhpMyAdmin URL: http://$minikube_ip:5000"
	echo "FTP Anonymous: ftp://$minikube_ip:30021"
	echo "FTP by fillezilla: ftp://$minikube_ip - port 30021 - pw: $password"
	echo "Connect Nginx by SSH: ssh $user@$minikube_ip -p 2022 - pw: $password"
fi


# /.*k8s([^-]*).*/
# /.*(ftps|grafana|influxdb|mysql|nginx|phpmyadmin|telegraf|wordpress)/