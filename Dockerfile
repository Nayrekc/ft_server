FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get install openssl
RUN apt-get -y install mariadb-server mariadb-client
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get -y install php-mbstring php-zip php-gd
RUN apt-get -y install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

COPY srcs/start.sh ./
COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./
COPY srcs/default ./
COPY srcs/defaultoff ./
COPY srcs/Autoindex.sh ./

CMD bash /start.sh

EXPOSE 80
EXPOSE 443
