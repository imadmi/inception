#!/bin/bash

# mysqld --verbose
service mariadb start 
service mysql start
sleep 10

echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" > cnf.sql
echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" >> cnf.sql
echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';" >> cnf.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" >> cnf.sql
echo "FLUSH PRIVILEGES;" >> cnf.sql

mariadb  < cnf.sql

rm -rf cnf.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
