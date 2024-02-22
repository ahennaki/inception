FROM debian:buster

ARG MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ARG MYSQL_USER=$MYSQL_USER
ARG MYSQL_PASSWORD=$MYSQL_PASSWORD

RUN apt-get update && apt-get install -y mariadb-server

WORKDIR /etc/mysql/mariadb.conf.d

COPY tools/mysql_cnf.sh /etc/mysql/

RUN  /bin/sh /etc/mysql/mysql_cnf.sh

EXPOSE 3306

CMD [ "mysqld_safe" ]

