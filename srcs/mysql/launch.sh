docker build -t mysql .
docker run --name mysql_container --rm -ti -p 3306:3306 mysql