FROM alpine

# Installation
# RUN apk update \
# && apk add --no-cache php-cli php-fpm php-mysqli

RUN mkdir -p /www
# RUN chown -R www-data:www-data /www
# COPY latest.tar.gz /tmp/
ADD https://wordpress.org/latest.tar.gz /tmp/
COPY wp-config.php /tmp/
# RUN tar -xvf /tmp/latest.tar.gz -C /www/ && rm /tmp/latest.tar.gz

# RUN adduser -g www-data www-data
# RUN adduser -D www-data www-data
# RUN echo "www-data:pw" | chpasswd
# RUN chown -R www-data:www-data /www/* && chmod -R 755 /www/*
# Copy init files
# COPY wordpress /var/www/localhost/htdocs
COPY wp.sh /usr/local/bin/

EXPOSE 5050

# CMD ["wp.sh"]

# CMD ["sh", "-c", "tail -f /dev/null"]

ENTRYPOINT ["wp.sh"]
