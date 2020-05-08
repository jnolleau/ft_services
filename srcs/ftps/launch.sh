docker build -t ftps .
docker run --name ftps_container --rm -ti -e USER -p 21:21 ftps