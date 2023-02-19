#!/bin/sh
set -euo pipefail

if [ "${1#-}" != "$1" ] || wp help "$1" > /dev/null 2>&1; then
	set -- wp "$@"
fi

exec "$@"


# Add info.php page
# echo "<?php echo phpinfo();?>" > /var/www/html/wordpress/info.php

# while ! mariadb -h$MYSQL_HOST -u$MYSQL_USER@localhost -p$MYSQL_PASSWORD $MYSQL_DATABASE;
# do 
	# sleep 3
# done
