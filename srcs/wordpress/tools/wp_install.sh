#!/bin/sh

echo "hellodoodododododododododododododoodododododododododod"

if [ -d ./wordpress/wp-admin ]; then
    echo "Wordpress already installed"
else
    echo "Wordpress is installing !"
    # mkdir wordpress
    cd wordpress
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root
    sleep 5
    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=$DB_HOST
    sleep 5
    echo "GAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA            wp config created               BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    wp core install --allow-root --url="alboumed.42.fr" --title="Blog Title" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp user create --allow-root $WP_USER $WP_USER_EMAIL --role=subscriber --user_pass=$WP_USER_PASSWORD
fi
/usr/sbin/php-fpm8.2 -F