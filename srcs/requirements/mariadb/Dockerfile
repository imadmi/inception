FROM debian:11

RUN apt update && apt install mariadb-server -y 

RUN service mariadb start

COPY ./conf/script.sh .
RUN chmod 777 ./script.sh

# -i to hide the output
RUN sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf  

EXPOSE 3306

CMD ["./script.sh"]

