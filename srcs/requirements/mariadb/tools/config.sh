#!/bin/bash

set -e

# Creates /run/mysqld and owns dirs on first run
if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

# This installs a new table onto the volume on first run
if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db \
		--basedir=/usr \
		--user=$MYSQL_USER \
		--datadir=/var/lib/mysql
	
	mariadbd --user=$MYSQL_USER < /tmp/config.sql
fi

# Returns PID 1 to Docker then handed to RUN mysqld
exec "$@"
