FROM debian:buster

ARG dbname=mydata
ARG dbuser=$MYSQL_USER
ARG dbpass=$MYSQL_PASSWORD
ARG dbhost=mariadb
ARG dbprefix=wp_

RUN apt update && apt-get install -y php-fpm php-mysql vim curl

WORKDIR /var/www/html
COPY tools/wp_cnf.sh /var/www/html/

EXPOSE 9000

ENTRYPOINT [ "/bin/sh", "/var/www/html/wp_cnf.sh" ]
