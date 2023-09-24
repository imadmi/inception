FROM debian:11

RUN apt update && apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=IMD/L=Khouribga/O=1337/OU=1337/CN=localhost/UID=imimouni"
    # -subj "/C=MA/ST=IMD/L=Khouribga/O=1337/OU=1337/CN=imimouni.42.fr/UID=imimouni"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html 

CMD ["nginx", "-g", "daemon off;"]
