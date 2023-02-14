#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mysql_install_db \
	--user=$MYSQL_USER \
	--datadir=$MYSQL_DB_DIR \
	$>/dev/null

exec /usr/bin/mysqld --user=$MYSQL_USER
