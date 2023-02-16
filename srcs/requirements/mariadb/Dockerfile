FROM alpine:3.16

RUN apk update && apk upgrade
RUN apk add mariadb

# MariaDB configuration files
RUN rm -rf /etc/my.cnf
COPY config/my.cnf /etc/my.cnf
COPY config/config.sql /tmp/config.sql

# Runs setup script
COPY tools/config.sh /tmp/config.sh
ENTRYPOINT [ "sh", "/tmp/config.sh" ]

# Loads mysqld as PID 1
CMD [ "mysqld", "--user=$MYSQL_USER" ]
