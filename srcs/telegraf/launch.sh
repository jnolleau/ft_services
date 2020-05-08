docker build -t telegraf .
docker run --name telegraf_container --rm -ti \
			-e USER \
			-v /var/run/docker.sock:/var/run/docker.sock:ro \
			-p 4999:4999 telegraf