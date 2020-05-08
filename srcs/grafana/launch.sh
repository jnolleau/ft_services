docker build -t grafana .
docker run --name grafana_container --rm -ti \
			-p 3000:3000 grafana
			# -v $(pwd)/data:/grafana-6.7.3/data \