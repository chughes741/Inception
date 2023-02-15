FROM alpine:3.16

RUN apk update && apk upgrade
RUN apk add mariadb

# MariaDB configuration files
RUN rm -rf /etc/my.cnf
COPY config/my.cnf /etc/my.cnf
COPY config/config.sql /tmp/config.sql

# Run
COPY tools/config.sh /tmp/config.sh
ENTRYPOINT [ "sh", "/tmp/config.sh" ]
