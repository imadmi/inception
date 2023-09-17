#!/bin/bash

service mariadb start 
sleep 10

echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" > db_inc.sql
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" >> db_inc.sql
echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';" >> db_inc.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" >> db_inc.sql

echo "FLUSH PRIVILEGES;" >> db_inc.sql

mariadb  < db_inc.sql

sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf


kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
