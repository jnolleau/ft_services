FROM alpine:latest

RUN apk update && apk add nginx openssh \
php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli \
php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
php7-ctype php7-dom php7-fpm php7-session php7-mbstring

RUN mkdir -p /run/nginx/
RUN ssh-keygen -A

COPY default.conf /etc/nginx/conf.d/
COPY wp.conf /etc/nginx/conf.d/

COPY ./certs/nginx-selfsigned.key /etc/ssl/
COPY ./certs/nginx-selfsigned.crt /etc/ssl/

COPY index.php /www/
COPY index.html /www/

# RUN set -x ; \
#   addgroup -g 82 -S www-data ; \
#   adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

# RUN adduser -D www-data
# RUN chown -R www-data:www-data /www/* && chmod -R 755 /www/*
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
