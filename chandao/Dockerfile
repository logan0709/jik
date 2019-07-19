FROM php:7.1-apache
RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt install -y curl unzip

# https://www.zentao.net/download/80153.html
RUN curl -fL -o ZenTaoPMS.11.6.stable.zip http://dl.cnezsoft.com/zentao/11.6/ZenTaoPMS.11.6.stable.zip

RUN unzip ZenTaoPMS.11.6.stable.zip -d /var/www/html \
    && rm -f ZenTaoPMS.11.6.stable.zip zentaopms/www/install.php zentaopms/www/upgrade.php

RUN {\
      echo "date.timezone=Asia/Shanghai";\
      echo "session.save_path=/tmp";\
    }>>/usr/local/etc/php/php.ini
ADD mysql-config.sh /
RUN chmod 777 /mysql-config.sh
# docker build -t chandao:11.6 .
# docker run -d --name=chandao -p 8080:80 -e MYSQL_HOST=10.96.10.101 -e MYSQL_PORT=3306 -e MYSQL_USER=root -e MYSQL_PASSWORD=weilus chandao:11.6
# http://192.168.1.37:8080/zentaopms/www/install.php