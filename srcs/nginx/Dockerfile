FROM debian:12

RUN apt-get update && \
    apt-get install -y nginx openssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/alboumed.42.fr.pem -keyout /etc/ssl/alboumed.42.fr.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=alboumed/CN=alboumed.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]