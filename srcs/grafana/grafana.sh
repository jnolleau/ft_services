#!/bin/sh
sed -i "s/admin_user = admin/admin_user = $USER/" /grafana-6.7.3/conf/defaults.ini
# chown grafana:grafana /grafana-6.7.3/data/grafana.db
cd /grafana-6.7.3/bin/ && ./grafana-server
/bin/sh