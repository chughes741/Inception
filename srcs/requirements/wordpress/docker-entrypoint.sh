#!/bin/sh
set -e

sleep 3

wp config create --allow-root --dbhost=$MYSQL_HOST --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER
wp db create --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
		--dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --path="/var/www/html"

exec "$@"