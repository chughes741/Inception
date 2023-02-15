#!/bin/sh

set -e

# Add info.php page
echo "<?php echo phpinfo();?>" > /var/www/html/wordpress/info.php

while ! mariadb -h$MYSQL_HOST -u$MYSQL_USER@localhost -p$MYSQL_PASSWORD $MYSQL_DATABASE;
do 
	sleep 3
done

exec "$@"
