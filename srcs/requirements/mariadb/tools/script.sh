#!/bin/bash

# service mariadb start #starts mariadb in the background

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" # % means the host can be any machine or any ip address
mysql -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MARIADB_PASSWORD shutdown

exec mysqld_safe

# mariadb  < file

# sed -i  "s/127.0.0.1/0.0.0.0/g"  /etc/mysql/mariadb.conf.d/50-server.cnf

# kill $(cat /var/run/mysqld/mysqld.pid)

# service mariadb start #starts mariadb in the background

# mysqld #starts mariadb in the foreground