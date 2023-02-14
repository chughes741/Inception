FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

# nginx config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# nginx ssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/chughes.42.fr.csr \
        -keyout /etc/nginx/ssl/chughes.42.fr.key \
        -subj "/C=CA/ST=Quebec/L=Quebec/O=42"

# start nginx
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
