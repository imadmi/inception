FROM debian:11.7

RUN apt update &&  apt upgrade -y && apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl

#-nodes, notre clef privée se retrouvera sans mot de passe.
#-x509 pour préciser le type du certificat.

RUN openssl req -x509 -nodes \ 
    -out /etc/nginx/ssl/cert.crt \
    -keyout /etc/nginx/ssl/cert.key \
    -subj "/C=/ST=/L=/O=/OU=/CN="

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
