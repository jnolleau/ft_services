#!/bin/sh

# chown -R mysql:mysql /var/lib/mysql
openrc default
rc-update add mariadb default
rc-service mariadb setup 2> /dev/NULL
rc-service mariadb start 2> /dev/NULL
mysql -u root < /tmp/wordpress.sql
rc-service mariadb stop 2> /dev/NULL
rm /tmp/wordpress.sql
mysqld
# mysqlshow
# /bin/sh
# sed -i 's/skip-networking/skip-networking = false/g' /etc/my.cnf.d/mariadb-server.cnf

# echo "Starting Mysql..."
# chown -R mysql:mysql /var/lib/mysql
# /etc/init.d/mariadb setup