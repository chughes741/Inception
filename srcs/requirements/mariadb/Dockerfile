FROM alpine:3.16

RUN apk update && apk upgrade
RUN apk add mariadb

# Run
COPY config/my.cnf /var/lib/mysql/my.cnf
COPY config/config.sql /tmp/config.sql
COPY tools/config.sh /tmp/config.sh
ENTRYPOINT [ "sh", "/tmp/config.sh" ]
