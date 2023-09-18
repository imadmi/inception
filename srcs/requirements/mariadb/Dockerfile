FROM debian:bullseye

RUN apt update && apt install mariadb-server -y 

# RUN rm -rf /var/lib/apt/lists/*

# # Create a directory to store MariaDB data
# RUN mkdir -p /var/lib/mysql

COPY ./tools/script.sh .
RUN chmod 777 ./script.sh

RUN service mariadb start

# -i to hide the output
RUN sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf  

EXPOSE 3306

CMD ["/script.sh"]


# # Start MariaDB manually
# CMD ["mysqld"]


