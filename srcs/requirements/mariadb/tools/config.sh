#!/bin/bash

# mkdir -p /run/mysqld
# chown -R mysql:mysql /run/mysqld
# chown -R mysql:mysql /var/lib/mysql

# This installs a new table onto the volume
# mysql_install_db \
	# --user=$MYSQL_USER \
	# --datadir=/var/lib/mysql \
	# $>/dev/null

# init SQL
# /usr/bin/mysqld --user=mysql --bootstrap

# /usr/bin/mysql mariadb-data < /tmp/load_data.sql

# exec mariadb --user=$MYSQL_USER
# exec /usr/bin/mysqld --user=$MYSQL_USER

tail -f /dev/null
