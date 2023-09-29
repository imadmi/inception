FROM debian:11.7

RUN apt update && apt upgrade -y && \
    apt install curl -y && \
    apt install mariadb-client -y && \
    apt install  php-mysql -y && \
    apt install php-fpm -y

COPY ./conf/script.sh .

RUN chmod 777 /script.sh

EXPOSE 9000

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod 777 wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wp cli update

# RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

CMD ["./script.sh"]