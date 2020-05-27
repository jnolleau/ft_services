FROM alpine:latest

RUN apk update && apk add nginx openssh \
php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli \
php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
php7-ctype php7-dom php7-fpm php7-session php7-mbstring

RUN mkdir -p /run/nginx/
RUN mkdir -p /www
RUN mkdir -p /https

RUN ssh-keygen -A

COPY default.conf /etc/nginx/conf.d/

COPY ./certs/nginx-selfsigned.key /etc/ssl/
COPY ./certs/nginx-selfsigned.crt /etc/ssl/

COPY index.php /www/
COPY index_https.php /https/

COPY nginx.sh /usr/local/bin/

EXPOSE 80 443 30022

ENTRYPOINT nginx.sh; /usr/sbin/php-fpm7; nginx -g "daemon off;"
