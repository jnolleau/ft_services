#!/bin/sh
sed -i 's/{{MINIKUBE_IP}}/$MINIKUBE_IP/' /www/config.inc.php
php -S 0.0.0.0:5000 -t /www/
