FROM debian:bullseye

RUN apt update && apt install mariadb-server -y 
