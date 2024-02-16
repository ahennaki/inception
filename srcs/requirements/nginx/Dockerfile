FROM debian:buster

RUN apt-get update && apt-get install -y ngnix openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/aennaki.crt -keyout /etc/nginx/ssl/aennaki.key \
	-subj "/C=MO/L=KH/O=42School/OU=aennaki/CN=aennaki/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


