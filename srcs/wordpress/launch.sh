docker build -t wordpress .
docker run --name wp_container --rm -ti -p 5050:5050 \
			-v $(pwd)/wordpress:/var/www/localhost/htdocs wordpress