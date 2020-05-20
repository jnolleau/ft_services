#!/bin/zsh

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
	minikube start --cpus=8 --memory=4096 --driver=docker --extra-config=apiserver.service-node-port-range=10-35000
	minikube addons enable dashboard
	minikube addons enable ingress
	minikube addons enable metrics-server
	
	# Collect minikube ip
	minikube_ip=`minikube ip`

	#Create config file from templates
	# mv $srcs/nginx.yaml.bak $srcs/nginx.yaml
	# mv $srcs/telegraf.yaml.bak $srcs/telegraf.yaml
	# mv $srcs/grafana.yaml.bak $srcs/grafana.yaml
	# mv $srcs/grafana/datas/telegraf_rs.yaml.bak $srcs/grafana/datas/telegraf_rs.yaml
	# mv $srcs/ftps/vsftpd.conf.bak $srcs/ftps/vsftpd.conf
	# mv $srcs/ftps/ftps.sh.bak $srcs/ftps/ftps.sh
	mv $srcs/config_map.yaml.bak $srcs/config_map.yaml
	
	# Set the minikube ip in several config files
	# sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/nginx.yaml
	# sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/telegraf.yaml
	# sed -i.bak "s/{{user}}/$user/g" $srcs/grafana.yaml
	# sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/grafana/datas/telegraf_rs.yaml
	# sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/ftps/vsftpd.conf
	# sed -i.bak "s/{{user}}/$user/g" $srcs/ftps/ftps.sh
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
		docker build -t ${service}_img $srcs/$service
	done

	# Create the ConfigMap containing environment var for containers
	kubectl apply -f ./srcs/config_map.yaml
	# Create peristent volumes
	kubectl apply -f ./srcs/volumes.yaml
	
	# Deploy all services
	# for service in "${services[@]}"
	# do
	# 	kubectl apply -f $srcs/$service.yaml
	# done

	kubectl apply -k ./srcs/
	
	# Create ingress for nginx
	kubectl apply -f $srcs/ingress.yaml

	sleep 5

	echo "======================================"
	echo "========== Cluster Settings =========="
	echo "======================================"
	echo "MINIKUBE_IP: $minikube_ip"
	echo "Nginx HTTP URL: `minikube service nginx --url | grep '80'`"
	echo "Nginx HTTPS URL: `minikube service nginx --url --https | grep '443'`"
	echo "Grafana URL: `minikube service grafana --url`"
	echo "Wordpress URL: http://$minikube_ip/wordpress/"
	echo "PhpMyAdmin URL: http://$minikube_ip/phpmyadmin/"
	# echo "Influxdb URL: `minikube service influxdb --url`"
	echo "FTP URL: ftp://$minikube_ip - Port 21"
fi
