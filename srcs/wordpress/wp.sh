#!/bin/sh
# mkdir -p /www
tar -xvf /tmp/latest.tar.gz -C /www/ && rm /tmp/latest.tar.gz
cp /tmp/wp-config.php /www/wordpress/

# echo "Starting php-fpm7..."
# /usr/sbin/php-fpm7
# /bin/sh
tail -f /dev/null