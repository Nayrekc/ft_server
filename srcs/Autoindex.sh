#!/bin/sh

if ! cmp -s /etc/nginx/sites-enabled/localhost defaultoff
then
	echo "index OFF"
	cp defaultoff /etc/nginx/sites-enabled/localhost
	cp /var/www/html/index.nginx-debian.html /var/www/localhost/index.html
elif ! cmp -s /etc/nginx/sites-enabled/localhost default
then
	echo "index ON"
	cp default /etc/nginx/sites-enabled/localhost
	rm -r /var/www/localhost/index.html
fi

service nginx reload
service nginx restart
