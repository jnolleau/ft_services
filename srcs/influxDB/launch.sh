docker build -t influxdb .
docker run --name idb_container --rm -ti -e USER -p 8086:8086 influxdb