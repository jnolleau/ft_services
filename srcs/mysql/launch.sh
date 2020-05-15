docker build -t mysql_local .
docker run --name mysql_container --rm -ti -p 3306:3306 mysql_local