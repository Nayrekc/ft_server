#!/bin/sh

#phpMyAdmin

#MYSQL

#NGINX command
mkdir var/www/localhost

#SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=LYON/L=LYON/O=42 CN=localhost"

#WORDPRESS

#RUN
service nginx start
sleep infinity
