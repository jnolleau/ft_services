#!/bin/bash

# List of the services, comment the ones you don't want to run
services=(		\
	nginx		\
	# ftps		\
	# wordpress	\
	# mysql		\
	# phpmyadmin	\
	influxdb	\
	telegraf	\
	grafana		\
	)
srcs='./srcs'


if [ $# -ge 1 ] && [ $1 = 'stop' ]
then
	# Purge Minikube
	eval $(minikube docker-env -u)
	minikube stop
	minikube delete
else

	# Launch Minikube ans install addons
	minikube start --cpus=8 --driver=docker --extra-config=apiserver.service-node-port-range=1-10000
	minikube addons enable dashboard
	minikube addons enable ingress
	minikube addons enable metrics-server
	
	# Set the environment variable to use local Docker
	eval $(minikube docker-env)

	# Collect minikube ip
	minikube_ip=`minikube ip`
	
	sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/nginx.yaml
	sed -i.bak "s/{{MINIKUBE_IP}}/$minikube_ip/g" $srcs/telegraf.yaml
	kubectl apply -f $srcs/ingress.yaml

	for service in "${services[@]}"
	do
		# Build Docker images
		docker build -t ${service}_img $srcs/$service
		# Deployment
		kubectl apply -f $srcs/$service.yaml
	done

	echo "MINIKUBE_IP: $minikube_ip"
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