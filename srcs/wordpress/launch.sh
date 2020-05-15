docker build -t wordpress_local .
docker run --name wp_container --rm -ti -p 5050:5050 wordpress_local