#!/bin/sh

mkdir -p /run/php/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp --allow-root core download


wp --allow-root core config --dbname=mydata --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb

wp --allow-root  core install --url="https://aennaki.42.fr" --title="Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email="ahmed.ennaki@email.com"

# #Download wordpress and all config file
# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz
# mv wordpress/* .
# rm -rf latest.tar.gz
# rm -rf wordpress

# #Inport env variables in the config file
# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# sed -i "s/localhost/mariadb/g" wp-config-sample.php
# sed -i "s/database_name_here/mydata/g" wp-config-sample.php
# cp wp-config-sample.php wp-config.php

sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

php-fpm7.3 -F
