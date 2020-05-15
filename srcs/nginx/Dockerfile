FROM alpine:latest

RUN apk update && apk add --no-cache nginx php-fpm openssh
RUN mkdir -p /run/nginx/
RUN ssh-keygen -A

COPY default.conf /etc/nginx/conf.d/
COPY wp.conf /etc/nginx/conf.d/

COPY ./certs/nginx-selfsigned.key /etc/ssl/
COPY ./certs/nginx-selfsigned.crt /etc/ssl/

COPY index.php /www/
COPY index.html /www/
# ADD include.php /www/

COPY nginx.sh /usr/local/bin/

# COPY ./certs/sshd_config /etc/ssh/

# RUN /usr/local/bin/nginx.sh

EXPOSE 80 443 2022

# CMD ["nginx", "-g", "daemon off;"]
# ENTRYPOINT ["nginx.sh"]
ENTRYPOINT nginx.sh; /usr/sbin/php-fpm7; nginx -g "daemon off;"
# ADD hello.conf /etc/nginx/modules/
# ADD default.conf /etc/nginx/conf.d/
# ADD index.html /usr/share/nginx/html/
