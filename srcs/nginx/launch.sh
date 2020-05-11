docker build -t nginx_img_local .
docker run --name nginx_container --rm -ti -p 80:80 \
			-e MINIKUBE_IP=localhost \
			-p 443:443 nginx_img_local