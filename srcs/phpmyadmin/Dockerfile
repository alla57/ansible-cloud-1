FROM debian:12

RUN DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y curl wget php php-common php-fpm php-mysqli php-xml php-mbstring php-cgi php-curl php-gd php-xmlrpc php-soap php-intl php-zip

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

WORKDIR /var/www/html

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz

RUN tar -xzvf phpMyAdmin-5.2.1-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.2.1-all-languages.tar.gz index.html
RUN mv phpMyAdmin-5.2.1-all-languages phpmyadmin

COPY ./conf/config.inc.php /var/www/html/phpmyadmin

EXPOSE 80

CMD ["/usr/sbin/php-fpm8.2", "-F"]