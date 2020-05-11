docker build -t telegraf_local .
docker run --name telegraf --rm -ti \
			-e USER \
			-e MINIKUBE_IP=172.17.0.2 \
			-v /var/run/docker.sock:/var/run/docker.sock:ro \
			--net=influxdb \
			-p 4999:4999 telegraf_local