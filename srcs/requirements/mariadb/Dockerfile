FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mysql.sh /usr/local/bin/mysql.sh

RUN chmod +x /usr/local/bin/mysql.sh

ENTRYPOINT [ "/usr/local/bin/mysql.sh" ]

