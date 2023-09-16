# Use the Alpine Linux 3.17.5 base image
FROM alpine:3.17.5

# Install Nginx
RUN apk update && apk add bash && apk add nginx

# Copy your Nginx configuration file
# COPY ./tools/nginx.conf /etc/nginx/nginx.conf

# Create a directory for the Nginx PID file
RUN mkdir -p /run/nginx

EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
