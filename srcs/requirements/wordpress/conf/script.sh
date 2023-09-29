#!/bin/bash


# Waiting for MariaDB
while ! mariadb -h$MARIADB_HOST -u$MARIADB_USER -p$MARIADB_PASSWORD $MARIADB_NAME &>/dev/null; do
    sleep 2
    echo "connecting to mariadb ..."
done


if [ ! -f "/usr/local/bin/wp" ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

    sleep 1

    chmod 777 wp-cli.phar 
    mv wp-cli.phar /usr/local/bin/wp
    wp cli update
fi

if [ ! -d "/var/www/html/" ]; then
    mkdir -p /var/www/html
fi


wp core download  --path="/var/www/html" --allow-root

# chown -R www-data:www-data /var/www/html/

cd /var/www/html/

wp config create --dbname=$MARIADB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST --path="/var/www/html" --allow-root --skip-check

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --path="/var/www/html" --allow-root

wp user create $WP_USR1 $WP_USR1_EMAIL --role=author --user_pass=$WP_USR1_PWD --path="/var/www/html" --allow-root   


sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php
/usr/sbin/php-fpm7.4 --nodaemonize
