#!/bin/bash

echo "<?php echo phpinfo();?>" > /var/www/html/wordpress/info.php

tail -f /dev/null
