
# Use the Debian Bullseye base image
FROM debian:bullseye

# Update the package repository and install Nginx
RUN apt update && apt install nginx -y


##

# RUN mkdir -p /etc/nginx/ssl
# RUN apt install openssl -y
# RUN openssl req -x509 -newkey rsa:2048 -nodes \
#     -out /etc/nginx/ssl/inception_crt.crt \
#     -keyout /etc/nginx/ssl/inception_key.key \
#     -subj "/C=MA/ST=IDF/L=KHOURIBGA/O=42/OU=42/CN=imimouni.42.fr/UID=imimouni"

##


# Copy your Nginx configuration file
COPY ./tools/nginx.conf /etc/nginx/sites-available/default

# Expose port 443 for HTTP
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
