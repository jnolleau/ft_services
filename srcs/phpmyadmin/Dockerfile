FROM alpine

# Installation
# RUN apk update && apk add phpmyadmin --no-cache --quiet

RUN mkdir -p /www

ADD http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz /tmp/

COPY config.inc.php /tmp/
COPY pma.sh /usr/local/bin/

EXPOSE 5000

# CMD ["sh", "-c", "tail -f /dev/null"]

ENTRYPOINT ["pma.sh"]
