FROM alpine

RUN apk update \
&& apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /www
RUN mkdir -p /www/phpmyadmin

ADD http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz /tmp/

RUN tar -xvf /tmp/phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components=1 -C /www/phpmyadmin \
&& rm /tmp/phpMyAdmin-5.0.2-all-languages.tar.gz

COPY config.inc.php /www/phpmyadmin/
COPY pma.sh /usr/local/bin/

EXPOSE 5000

ENTRYPOINT ["pma.sh"]
