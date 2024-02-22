FROM debian:buster

RUN apt update && apt install nginx -y

COPY tools/nginx_config.sh /etc/nginx/

RUN chmod +x /etc/nginx/nginx_config.sh

RUN /bin/sh /etc/nginx/nginx_config.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
