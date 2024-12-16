FROM debian:12

RUN apt-get update && apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget php php-fpm php-mysqli php-xml php-mbstring php-cgi php-curl php-gd php-xmlrpc php-soap php-intl php-zip

RUN DEBIAN_FRONTEND=dialog

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
# RUN mkdir /run/php

EXPOSE 9000

COPY ./tools/wp_install.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_install.sh

WORKDIR /var/www/html/

ENTRYPOINT ["/usr/local/bin/wp_install.sh"]