FROM debian:11

RUN apt update && apt install mariadb-server -y 
