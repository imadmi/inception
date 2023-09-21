# Use the Debian Bullseye base image
FROM debian:bullseye

# Update the package repository and install Nginx and OpenSSL
RUN apt update && apt install nginx openssl -y

# Create a directory to store SSL certificate and key for secure connections
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate and key for testing purposes
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=MA/ST=IMD/L=Khouribga/O=1337/OU=1337/CN=localhost/UID=imimouni"
    # -subj "/C=MA/ST=IMD/L=Khouribga/O=1337/OU=1337/CN=imimouni.42.fr/UID=imimouni"

# Copy your Nginx configuration file to the default sites-available directory
COPY ./tools/nginx.conf /etc/nginx/sites-available/default

# Expose port 443 for HTTPS
EXPOSE 443

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html 


# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
