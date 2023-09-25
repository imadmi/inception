FROM debian:11

RUN apt update && apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/cert.crt \
    -keyout /etc/nginx/ssl/cert.key \
    -subj "/C=42/ST=42/L=42/O=42/OU=42/CN=imimouni.42.fr/UID=imimouni"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
