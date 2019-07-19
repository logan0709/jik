FROM php:7.1-apache
RUN docker-php-ext-install pdo_mysql

RUN apt-get install unzip curl

# https://www.zentao.net/download/80153.html
RUN curl -fL -o ZenTaoPMS.11.6.stable.zip http://dl.cnezsoft.com/zentao/11.6/ZenTaoPMS.11.6.stable.zip

RUN unzip ZenTaoPMS.11.6.stable.zip -d /var/www/html