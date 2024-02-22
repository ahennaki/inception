#!/bin/sh

mkdir -p /run/php/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp --allow-root core download

wp core config --dbname=mydata --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --dbprefix=wp_ --allow-root --skip-check

wp --allow-root  core install --url="https://aennaki.42.fr" --title="My Site" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="aennaki@email.com"

wp theme install ultrabootstrap --activate --allow-root

groupadd www-pub 
usermod -a -G www-pub www-data
