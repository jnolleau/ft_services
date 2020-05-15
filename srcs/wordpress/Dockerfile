FROM alpine

# Installation
# RUN apk update \
# && apk add --no-cache php-cli php-fpm php-mysqli

RUN mkdir -p /www
COPY latest.tar.gz /tmp/
RUN tar -xvf /tmp/latest.tar.gz -C /www/ && rm /tmp/latest.tar.gz

# Copy init files
# COPY wordpress /var/www/localhost/htdocs
# COPY wp.sh /usr/local/bin/

EXPOSE 5050

CMD ["sh", "-c", "tail -f /dev/null"]

# ENTRYPOINT ["wp.sh"]
