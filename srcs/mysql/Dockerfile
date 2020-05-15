FROM alpine

# Installation
RUN apk update \
&& apk add openrc mariadb mariadb-client --no-cache \
&& addgroup mysql mysql

# Copy init files
COPY wordpress.sql /tmp/
COPY mysql.sh /usr/local/bin/
COPY my.cnf /etc/mysql/my.cnf

# VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["mysql.sh"]
