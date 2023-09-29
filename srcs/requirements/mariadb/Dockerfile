FROM debian:11.7

RUN apt update && apt upgrade -y && apt install mariadb-server -y 

COPY ./conf/script.sh .
RUN chmod 777 ./script.sh

# RUN service mariadb start 
# RUN sleep 5

# RUN sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf  

EXPOSE 3306

# RUN chown mysql:mysql /var/lib/mysql/aria_log_control

CMD ["./script.sh"]