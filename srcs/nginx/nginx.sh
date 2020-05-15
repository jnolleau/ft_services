#!/bin/sh
sed -i 's/;clear_env/clear_env/' /etc/php7/php-fpm.d/www.conf
echo 'env["MINIKUBE_IP"] = $MINIKUBE_IP' >> /etc/php7/php-fpm.d/www.conf
echo 'env["NGINX_SERVICE_PORT_SSH"] = $NGINX_SERVICE_PORT_SSH' >> /etc/php7/php-fpm.d/www.conf

# User for ssh
adduser -D $USER
echo "$USER:$PASSWORD" | chpasswd
echo "root:$PASSWORD" | chpasswd
sed -i "s/#Port 22/Port $NGINX_SERVICE_PORT_SSH/" /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

sed -i "s/{{WORDPRESS_PORT_5050_TCP_ADDR}}/$WORDPRESS_PORT_5050_TCP_ADDR/" /etc/nginx/conf.d/wp.conf

/usr/sbin/sshd
# echo "Starting php-fpm7..."
# /usr/sbin/php-fpm7
# echo "Starting Nginx..."
# nginx
# /bin/sh