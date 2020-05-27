docker build -t wordpress_local .
docker run --name wp_container --rm -ti \
			-p 5050:5050 \
			--net=mysql-test \
			-e WORDPRESS_DB_HOST='mysql' \
			-e WORDPRESS_DB_PASSWORD='pw' \
			wordpress_local