FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget lsb-release gnupg

WORKDIR /root

RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.30-1_all.deb &&\
    dpkg -i mysql-apt-config_0.8.30-1_all.deb &&\
    apt-get update

RUN apt-get install mysql-server -y

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./tools/create_db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_db.sh

EXPOSE 3306

ENTRYPOINT ["create_db.sh"]

CMD ["mysqld", "--user=mysql", "--bind-address=0.0.0.0"]