#!/bin/sh
message='Welcome on ft_services by julnolle ! Please use ftp client (Filezilla) to connect with SSL.'
message2='ft_services over SSL by julnolle !'

openrc default

openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
	-subj "/C=FR/ST=fr/L=Paris/O=School_42/CN=julnolle" \
	-out /etc/ssl/private/vsftpd.cert.pem \
	-keyout /etc/ssl/private/vsftpd.key.pem

chown root:root /etc/ssl/private/vsftpd.cert.*
chmod 600 /etc/ssl/private/vsftpd.cert.*

mkdir -p /srv/ftp
chown nobody:nogroup /srv/ftp
echo "$message" > /srv/ftp/README

adduser -D $USER
echo "$USER:$PASSWORD" | chpasswd
echo "$message2" > /home/$USER/README
rc-update add vsftpd default

sed -i "s/{{MINIKUBE_IP}}/$MINIKUBE_IP/" /etc/vsftpd/vsftpd.conf

cd /etc/init.d/ && vsftpd "/etc/vsftpd/vsftpd.conf"
# rc-service vsftpd start 2> /dev/NULL
# /bin/sh