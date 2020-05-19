#!/bin/sh

# openrc default
# rc-update add phpmyadmin default
# rc-service phpmyadmin start 2> /dev/NULL
# /bin/sh
mkdir -p /www/phpmyadmin
tar -xvf /tmp/phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components=1 -C /www/phpmyadmin \
&& rm /tmp/phpMyAdmin-5.0.2-all-languages.tar.gz
cp /tmp/config.inc.php /www/phpmyadmin/

tail -f /dev/null
# /etc/init.d/phpmyadmin setup