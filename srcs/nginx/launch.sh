docker build -t nginx_img_local .
docker run --name nginx_container --rm -ti -p 80:80 \
			-e MINIKUBE_IP=localhost \
			-e USER \
			-e PASSWORD=pw \
			-e NGINX_SERVICE_PORT_SSH=22 \
			-p 443:443 nginx_img_local