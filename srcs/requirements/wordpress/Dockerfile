FROM debian:11

RUN apt-get update && \
    apt-get install -y curl mariadb-client php-mysql php-fpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY ./conf/script.sh .

RUN chmod 777 /script.sh

EXPOSE 9000

CMD ["./script.sh"]