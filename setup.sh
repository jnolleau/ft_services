#!/bin/bash

# You can comment service(s) if you want to test without some.
services=(		\
 	nginx		\
	ftps		\
	wordpress	\
	mysql		\
	phpmyadmin	\
	grafana		\
	influxdb	\
)
echo ${services[1]}

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
