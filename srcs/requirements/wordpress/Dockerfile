FROM debian:buster

ARG dbname=mydata
ARG dbuser=$MYSQL_USER
ARG dbpass=$MYSQL_PASSWORD
ARG dbhost=mariadb
ARG dbprefix=wp_

RUN apt update && apt-get install -y php php-fpm php-mysql php-cgi php-pdo php-gd php-cli curl wget

WORKDIR /var/www/html

COPY tools/wp_cnf.sh /var/www/html/

COPY conf/wp-config.php /

EXPOSE 9000

ENTRYPOINT [ "/bin/sh", "/var/www/html/wp_cnf.sh" ]
