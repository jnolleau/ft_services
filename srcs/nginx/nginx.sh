#!/bin/sh

# PHP config in order to use env variables in php files
sed -i 's/;clear_env/clear_env/' /etc/php7/php-fpm.d/www.conf
echo 'env["MINIKUBE_IP"] = $MINIKUBE_IP' >> /etc/php7/php-fpm.d/www.conf
echo 'env["FTPS_SERVICE_PORT_FTPS"] = $FTPS_SERVICE_PORT_FTPS' >> /etc/php7/php-fpm.d/www.conf
echo 'env["NGINX_SSH_SERVICE_PORT_SSH"] = $NGINX_SSH_SERVICE_PORT_SSH' >> /etc/php7/php-fpm.d/www.conf
echo 'env["USER"] = $USER' >> /etc/php7/php-fpm.d/www.conf
echo 'env["PASSWORD"] = $PASSWORD' >> /etc/php7/php-fpm.d/www.conf

# User for ssh
adduser -D $USER
echo "$USER:$PASSWORD" | chpasswd
echo "root:$PASSWORD" | chpasswd
sed -i "s/#Port 22/Port $NGINX_SSH_SERVICE_PORT_SSH/" /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Openssh start
/usr/sbin/sshd
