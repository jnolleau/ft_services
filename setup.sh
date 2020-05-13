#!/bin/bash

# List of the services, comment the ones you don't want to run
services=(		\
	nginx		\
	ftps		\
	# wordpress	\
	# mysql		\
	# phpmyadmin	\
	influxdb	\
	telegraf	\
	grafana		\
	)

# Images source directory
srcs='./srcs'

# Passwords wherever it is needed
password='pw'


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
	mv $srcs/grafana/datas/telegraf_rs.yaml.bak $srcs/grafana/datas/telegraf_rs.yaml
	mv $srcs/ftps/vsftpd.conf.bak $srcs/ftps/vsftpd.conf
	# mv $srcs/ftps/ftps.sh.bak $srcs/ftps/ftps.sh
	mv $srcs/config_map.yaml.bak $srcs/config_map.yaml
	
	# Set the minikube ip in several config files
	# sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/nginx.yaml
	# sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/telegraf.yaml
	# sed -i.bak "s/{{USER}}/$USER/g" $srcs/grafana.yaml
	sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/grafana/datas/telegraf_rs.yaml
	sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/ftps/vsftpd.conf
	# sed -i.bak "s/{{USER}}/$USER/g" $srcs/ftps/ftps.sh
	sed -i.bak "s/{{USER}}/$USER/g; \
				s/{{MINIKUBE_IP}}/$minikube_ip/g; \
				s/{{PW}}/$password/g" $srcs/config_map.yaml
	
	sleep 4

	# Set the environment variable to use local Docker
	eval $(minikube docker-env)

	# Create the ConfigMap containing environment var for containers
	kubectl create -f ./srcs/config_map.yaml
	# Create peristent volumes
	kubectl apply -f ./srcs/volumes.yaml

	# Build images and deploy all services
	for service in "${services[@]}"
	do
		# Build Docker images
		docker build -t ${service}_img $srcs/$service
		# # Deployment
		# kubectl apply -f $srcs/$service.yaml
	done

	# Deployment
	kubectl apply -k ./srcs/
	# Apply ingress for nginx
	kubectl apply -f $srcs/ingress.yaml

	sleep 5

	echo "======================================"
	echo "========== Cluster Settings =========="
	echo "======================================"
	echo "MINIKUBE_IP: $minikube_ip"
	echo "Nginx HTTP URL: `minikube service nginx --url | grep '80'`"
	echo "Nginx HTTPS URL: `minikube service nginx --url --https | grep '443'`"
	echo "Grafana URL: `minikube service grafana --url`"
	echo "Influxdb URL: `minikube service influxdb --url`"
	echo "FTP URL: ftp://`minikube service ftps --url | grep 30 | cut -b 8-17` - Port 21"
fi





# echo "Building images:"
# for service in "${services[@]}"
# do
# 	# timer init
# 	service_timer_start=`date +%s`
# 	echo "	->$service:"
# 	echo "		Building new image..."		
# 	docker build -t $service-image $srcs/$service > /dev/null # build archive
# 	if [[ $service == "nginx" ]]
# 	then
# 		kubectl delete -f srcs/ingress-deployment.yaml >/dev/null 2>&1
# 		echo "		Creating ingress for nginx..."
# 		kubectl apply -f srcs/ingress-deployment.yaml > /dev/null
# 	fi
# 	kubectl delete -f srcs/$service-deployment.yaml > /dev/null 2>&1
# 	echo "		Creating container..."
# 	kubectl apply -f srcs/$service-deployment.yaml > /dev/null
# 	while [[ $(kubectl get pods -l app=$service -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]];
# 	do
# 		sleep 1;
# 	done
# 	sed -i '' s/__$service-POD__/$(kubectl get pods | grep $service | cut -d" " -f1)/g $srcs/grafana/srcs/global.json
# 	#end timer
# 	service_timer_end=`date +%s`
# 	runtime=$((service_timer_end-service_timer_start))
# 	echo "	done - $runtime seconds"
# done 

# sudo systemctl start docker
# minikube start --driver=docker --cpus=4
# minikube addons enable dashboard
# minikube addons enable ingress
# minikube addons enable metrics-server
# minikube status

# kubectl run nginx --image=nginx
# kubectl get pods
# kubectl expose nginx first-deployment --port=80 --type=NodePort
# kubectl create deployment nginx --image=katacoda/docker-http-serve

# minikube stop
# minikube delete

# echo 'pid /run/nginx.pid;' | cat - nginx.conf > temp && mv temp nginx.conf

# docker rmi $(docker images -a -q)