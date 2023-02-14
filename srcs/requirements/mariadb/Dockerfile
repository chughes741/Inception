FROM alpine:3.16

# Install MariaDB
RUN apk update && apk add mariadb mariadb-client

# Run
COPY tools/config.sh /tmp/config.sh
ENTRYPOINT [ "sh", "/tmp/config.sh" ]
