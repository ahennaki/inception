#!/bin/sh

service mysql start

sed -i 's/#port                   = 3306/port = 3306/' 50-server.cnf
sed -i 's/bind-address            = 127.0.0.1/bind-address            = */' 50-server.cnf

echo "CREATE DATABASE mydata;" | mysql -u root

echo "USE mydata;" | mysql -u root

echo "GRANT ALL PRIVILEGES ON mydata.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"  | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root

echo "ALTER  USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root -p$MYSQL_ROOT_PASSWORD shutdown

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
