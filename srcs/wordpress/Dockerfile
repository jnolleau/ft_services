FROM alpine

# Installation
RUN apk update \
&& apk add --no-cache php-cli php-fpm php-mysqli

# Copy init files
# COPY wordpress /var/www/localhost/htdocs
COPY wp.sh /usr/local/bin/
COPY latest.tar.gz /tmp/

EXPOSE 5050

ENTRYPOINT ["wp.sh"]
