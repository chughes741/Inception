FROM alpine:3.16

# Install MariaDB
RUN apk update && apk add mariadb

# Run configuration script
COPY tools/config.sh /tmp/config.sh
RUN chmod -x /tmp/config.sh

# Run
COPY tools/run.sh /tmp/run.sh
ENTRYPOINT [ "sh", "/tmp/config.sh" ]
