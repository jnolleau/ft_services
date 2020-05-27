#!/bin/sh
# mkdir -p /www
# tar -xvf /tmp/latest.tar.gz -C /www/ && rm /tmp/latest.tar.gz
# cp /tmp/wp-config.php /www/wordpress/

# PHP config in order to use env variables in php files
sed -i 's/;clear_env/clear_env/' /etc/php7/php-fpm.d/www.conf
echo 'env["MINIKUBE_IP"] = $MINIKUBE_IP' >> /etc/php7/php-fpm.d/www.conf

# sed -i "s/{{MINIKUBE_IP}}/$MINIKUBE_IP/" /www/wordpress/wp-config.php

php -S 0.0.0.0:5050 -t /www/wordpress/