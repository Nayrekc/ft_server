#!/bin/sh

#phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin
service php7.3-fpm start


#MYSQL

service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#NGINX command
mkdir var/www/localhost
mv ./default etc/nginx/sites-available
mv ./index.html var/www/localhost
mv ./test.php var/www/localhost

#SSL

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
mkdir var/www/localhost/wordpress
cp -a wordpress/. /var/www/localhost/wordpress
mv ./wp-config.php /var/www/localhost/wordpress


#RUN
service nginx start
service php7.3-fpm restart
service mysql restart
sleep infinity
