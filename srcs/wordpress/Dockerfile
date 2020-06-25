FROM alpine:latest

# Installation
RUN apk update \
&& apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress /var/tmp/
RUN cp -R /var/tmp/wordpress/* /var/tmp/
RUN rm -R /var/tmp/wordpress/
COPY wp-config.php /var/tmp/

COPY wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp.sh

ENTRYPOINT ["wp.sh"]