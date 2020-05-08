docker build -t nginx .
docker run --name nginx_container --rm -ti -p 80:80 -p 443:443 nginx