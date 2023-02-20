FROM alpine:3.16

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

# MariaDB configuration files
RUN rm -rf /etc/my.cnf
COPY config/my.cnf /etc/my.cnf

# Runs setup script
COPY tools/config.sh /tmp/config.sh
ENTRYPOINT [ "sh", "/tmp/config.sh" ]

# Loads mysqld as PID 1
CMD [ "mysqld" ]
