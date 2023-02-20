#!/bin/sh

#check if wp-config.php exist
if [ ! -f ./wp-config.php ]; then

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

exec "$@"


# while ! mariadb -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE &>/dev/null; do
    # sleep 5
# done

# if [ ! -f /tmp/done_config ]; then
	# touch /tmp/done_config

	# wp core download --allow-root
    # wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
		# --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbcharset="utf8" \
		# --dbcollate="utf8_general_ci" --allow-root
    # wp core install --url=$DOMAIN_NAME/wordpress --title=$WORDPRESS_TITLE \
		# --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD \
		# --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
    # wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author \
		# --user_pass=$WORDPRESS_PASSWORD --allow-root
# fi
