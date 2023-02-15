#!/bin/bash

# Add info.php page
echo "<?php echo phpinfo();?>" > /var/www/html/wordpress/info.php

mariadb \
	-h$MYSQL_HOST \
	-u$MYSQL_USER \
	-p$MYSQL_PASSWORD \
	$MYSQL_DATABASE

tail -f /dev/null
