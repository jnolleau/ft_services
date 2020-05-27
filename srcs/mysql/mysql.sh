#!/bin/sh

openrc default
rc-update add mariadb default
rc-service mariadb setup 2> /dev/NULL
rc-service mariadb start 2> /dev/NULL

# mysql -u root -e "CREATE USER '${USER}'@'%' IDENTIFIED BY ${MYSQL_ROOT_PASSWORD};"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${USER}'@'%' WITH GRANT OPTION;"
mysql -u root < /tmp/wordpress.sql
mysql -u root < /tmp/mysql.sql

rc-service mariadb stop 2> /dev/NULL
rm /tmp/wordpress.sql
mysqld
