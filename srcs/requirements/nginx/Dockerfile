FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx openssl vim curl

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/aennaki.crt -keyout /etc/nginx/ssl/aennaki.key \
	-subj "/C=MO/L=KH/O=42School/OU=aennaki/CN=aennaki.42.fr"

RUN mkdir -p /var/run/nginx

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]

