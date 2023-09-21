#!/bin/bash

service mariadb start 
sleep 2

# env variables
MARIADB_ROOT_PASSWORD=123456789abc
MARIADB_NAME=maria_db
MARIADB_USER=imad
MARIADB_PASSWORD=imaddb
MARIADB_HOST=mariadb

# Run MySQL commands with the root user and password
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$MARIADB_NAME\`;"
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS \`$MARIADB_USER\`@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO \`$MARIADB_USER\`@'%';"
mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld