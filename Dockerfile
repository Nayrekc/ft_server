FROM debian:buster-slim

RUN apt-get -y update && apt-get -y install mariadb-server \
		wget \
		php \
		php-cli \
		php-cgi \
		php-mbstring \
		php-fpm \
		php-mysql \
		nginx \
		libnss3-tools \
		openssl


COPY srcs/start.sh ./
COPY srcs/default ./

CMD bash /start.sh

EXPOSE 80
EXPOSE 443
