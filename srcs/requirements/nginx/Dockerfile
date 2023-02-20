FROM alpine:3.16

RUN apk update && apk add nginx openssl

# nginx config
# RUN mkdir -p /run/nginx

RUN mkdir -p /var/www/html /etc/nginx/ssl/certificates /etc/nginx/ssl/keys

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

# nginx ssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/certificates/sslcert.csr \
        -keyout /etc/nginx/ssl/keys/sslcert.key \
        -subj "/C=CA/ST=Quebec/L=Quebec City/O=42School/OU=42Quebec/CN=chughes.42.fr"

# start nginx
CMD [ "nginx", "-g", "daemon off;" ]
