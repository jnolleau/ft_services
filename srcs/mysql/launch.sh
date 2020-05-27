docker build -t mysql_local .
docker run --name mysql_container --rm -ti \
		-p 3306:3306 \
		--net=mysql-test \
		-e MYSQL_ROOT_PASSWORD='pw' \
		-e USER \
		mysql_local