#!/bin/bash

rm -R /var/lib/mysql/*
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
/etc/init.d/mysql stop

# rm -rf /var/lib/mysql/aria_log_control
# touch /var/lib/mysql/aria_log_control

service mariadb start 
sleep 5
# chown -R mysql:mysql /var/lib/mysql
# kill -SIGTERM <PID>

# echo "CREATE DATABASE IF NOT EXISTS maria_db;" > cnf.sql
# echo "CREATE USER IF NOT EXISTS 'imad'@'%' IDENTIFIED BY 'imaddb';" >> cnf.sql
# echo "GRANT ALL PRIVILEGES ON maria_db.* TO 'imad'@'%';" >> cnf.sql
# echo "FLUSH PRIVILEGES;" >> cnf.sql


mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';"
# mariadb -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_PASSWORD';"

# sleep 10
# mariadb -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"
# mariadb -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
# mariadb -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
# mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_PASSWORD';"
# mariadb -e "FLUSH PRIVILEGES;"


# mariadb -u root < cnf.sql
# rm -rf cnf.sql

sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf  

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld