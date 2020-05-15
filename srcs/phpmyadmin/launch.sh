docker build -t phpmyadmin_local .
docker run --name pma_container --rm -ti -e USER -p 5000:5000 phpmyadmin_local