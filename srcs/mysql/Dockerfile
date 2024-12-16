FROM debian:12

# ENV DB_NAME=wordpress_db DB_USER=user DB_PASSWORD=db_P4sswrd DB_HOST=mysql DB_ROOT_PASSWORD=db_root_P4sswrd

# Set environment to suppress prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade the base image
RUN apt-get update && apt-get upgrade -y

# Install wget and required tools
RUN apt-get install -y wget lsb-release gnupg

# Set working directory
WORKDIR /root

# Download and install MySQL APT configuration package
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.30-1_all.deb &&\
    dpkg -i mysql-apt-config_0.8.30-1_all.deb &&\
    apt-get update

# Install MySQL server
RUN apt-get install mysql-server -y

# Ensure proper ownership for MySQL directories
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./tools/create_db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_db.sh

# Switch to the mysql user for running MySQL
# USER mysql

EXPOSE 3306

# RUN create_db.sh

ENTRYPOINT ["create_db.sh"]
# CMD ["/bin/bash"]

CMD ["mysqld", "--user=mysql", "--bind-address=0.0.0.0"]