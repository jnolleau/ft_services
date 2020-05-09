docker build -t telegraf .
docker run --name telegraf --rm -ti \
			-e USER \
			-v /var/run/docker.sock:/var/run/docker.sock:ro \
			--net=influxdb \
			-p 4999:4999 telegraf