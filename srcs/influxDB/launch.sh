docker network create influxdb 
docker build -t influxdb .
docker run --name influxdb --rm -ti \
			-e USER \
			--net=influxdb \
			-p 8086:8086 influxdb