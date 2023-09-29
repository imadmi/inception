FROM debian:11.7

RUN apt update &&  apt upgrade -y && apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey -nodes \
    -out /etc/nginx/ssl/cert.crt \
    -keyout /etc/nginx/ssl/cert.key \
    -subj "/C=/ST=/L=/O=/OU=/CN="

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
