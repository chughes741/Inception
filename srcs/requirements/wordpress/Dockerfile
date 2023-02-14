FROM alpine:3.16

# persistent / runtime deps
RUN apk add --no-cache	\
		wget			\
        tar				\
		mariadb-client	\
		php-fpm


# php-fpm config
COPY conf/www.conf /etc/php/php-fpm.d/www.conf
COPY conf/php-fpm.conf /etc/php/php-fpm.conf

# install WordPress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html/wordpress

COPY tools/config.sh /tmp/config.sh
RUN chmod -x /tmp/config.sh

COPY tools/run.sh /tmp/run.sh
ENTRYPOINT [ "sh", "/tmp/run.sh" ]
