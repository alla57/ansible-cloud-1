#!/bin/bash

# Allow the script to stop immediately if any command fails
set -e

if [ ! -f /mysql-initialized ]; then

    echo "Initializing MySQL for the first time..."

    mysqld --initialize-insecure --user=mysql &

    # Start mysql server in the background
    mysqld_safe --user=mysql &

    # Wait for MySQL to start
    echo "Waiting for MySQL to start..."
    until mysqladmin ping --silent; do
        sleep 1
    done

    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    echo "user created"
    mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    echo "privilges granted to user"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';"
    echo "privilges granted to root"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "SHUTDOWN;"

    touch /mysql-initialized
fi

exec "$@"