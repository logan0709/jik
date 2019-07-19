FROM php:7.1-apache
RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt install -y curl unzip

# https://www.zentao.net/download/80153.html
RUN curl -fL -o ZenTaoPMS.11.6.stable.zip http://dl.cnezsoft.com/zentao/11.6/ZenTaoPMS.11.6.stable.zip

RUN unzip ZenTaoPMS.11.6.stable.zip -d /zentao \
    && rm -f ZenTaoPMS.11.6.stable.zip \
    && mv /zentao/zentaopms/www /var/www/html/ \
    && rm -rf /zentao && rm -f /var/www/html/install.php

RUN {\
      echo "date.timezone=Asia/Shanghai";\
      echo "session.save_path=/tmp";\
    }>>/usr/local/etc/php/php.ini

COPY my.php /var/www/html/config/my.php

# docker run -d --name=chandao -p 8080:80 chandao:11.6
# http://192.168.1.37:8080/zentaopms/www/install.php