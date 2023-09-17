
# Use the Debian Bullseye base image
FROM debian:bullseye

# Update the package repository and install Nginx
RUN apt update && apt install nginx openssl -y


RUN mkdir -p /etc/nginx/ssl      # permettra de stocker le certificat et la clef pour une connexion sécurisée.
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=imimouni.42.fr/UID=imimouni"


# RUN mkdir -p /var/run/nginx      # stocker les fichiers de config de NGINX


# Copy your Nginx configuration file
COPY ./tools/nginx.conf /etc/nginx/sites-available/default

# Expose port 443 for HTTP
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
