FROM debian:buster

RUN apt update && apt-get install -y php php-fpm php-mysql curl

WORKDIR /var/www/html

COPY tools/wp_cnf.sh /var/www/html/

COPY conf/wp-config.php /

EXPOSE 9000

ENTRYPOINT [ "/bin/sh", "/var/www/html/wp_cnf.sh" ]
