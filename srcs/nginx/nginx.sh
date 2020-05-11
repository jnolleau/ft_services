#!/bin/sh
sed -i 's/;clear_env/clear_env/' /etc/php7/php-fpm.d/www.conf
echo 'env["MINIKUBE_IP"] = $MINIKUBE_IP' >> /etc/php7/php-fpm.d/www.conf

# echo "Starting php-fpm7..."
# /usr/sbin/php-fpm7
# echo "Starting Nginx..."
# nginx
# /bin/sh