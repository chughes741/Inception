FROM debian:buster

# testing
RUN apt-get update && apt-get install -y nginx openssl
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
