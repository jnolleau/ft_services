#!/bin/sh
chown grafana:grafana /grafana-6.7.3/data/grafana.db
cd /grafana-6.7.3/bin/ && ./grafana-server
/bin/sh