FROM alpine:latest

# Installation
RUN apk update \
&& apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /www

ADD https://wordpress.org/latest.tar.gz /tmp/
RUN tar -xvf /tmp/latest.tar.gz -C /www/ && rm /tmp/latest.tar.gz
COPY wp-config.php /www/wordpress/

COPY wp.sh /usr/local/bin/

EXPOSE 5050

ENTRYPOINT ["wp.sh"]
