#!/bin/sh

sed -i "s/admin_user = admin/admin_user = $USER/" /grafana-7.0.1/conf/defaults.ini
sed -i "s/admin_password = admin/admin_password = $PASSWORD/" /grafana-7.0.1/conf/defaults.ini

cd /grafana-7.0.1/bin/ && ./grafana-server
