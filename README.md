# ft_services

Setting-up a multi-services cluster based on Docker and deployed with Kubernetes.  
Each service is running in a dedicated container, working on Apline Linux.  
All docker images are especially crafted for this project, none are from external registry.  

## What's included
### The cluster is composed by these services, running in separate containers :

- WordPress listening on port 5050.
- phpMyAdmin, listening on port 5000.
- MySQL database. Only accessible internally by others containers. In a persistant Volume.
- Nginx server listening on ports 80 and 443.
- FTP server: vsftpd listening on port 21.
- Grafana, listening on port 3000 for monitoring all containers, with one dashboard by service.
- telegraf for collecting and sending metrics.
- InfluxDB database to store metrics. In a persistant Volume.

### Some precisions:
- In case of a crash or stop of one of the two database containers, the data persist.
- The Nginx container is accessible by ssh on port 30022.
- The containers can restart thanks to liveness probes.
- The Kubernetes web dashboard is used to check the containers.

## Some usefull commands

### Start minikube:
```sh
minikube start
```
### Open dashboard:
```sh
minikube dashboard
```
### Get pods info:
```sh
kubectl get pods
```
### Lanch a shell into a container:
```sh
kubectl exec -it [pod_name] -- /bin/sh
```
### Connect via ssh:
```sh
ssh $(user)@$(minikube ip) -p 30022 - password: $(password)
```
### Delete container:
```sh
kubectl exec -it $(kubectl get pods | grep pod_name | cut -d" " -f1) -c container_name -- /bin/sh -c "kill 1"
```
### Apply all K8's files:
```sh
./apply_all.sh
```
### Delete all:
```sh
./delete_all.sh
```