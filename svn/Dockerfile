FROM alpine:3.5
RUN apk update && apk add apache2 apache2-utils apache2-webdav subversion mod_dav_svn

COPY authz /etc/apache2/conf
COPY passwd /etc/apache2/conf
ADD subversion.conf /etc/apache2/conf.d

ENV APACHE_RUN_USER root
ENV APACHE_RUN_GROUP root
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir -p /svn/repo /run/apache2 && chmod 777 -R /svn/repo

EXPOSE 80
VOLUME ["/svn/repo"]
WORKDIR /var/www/localhost/htdocs

CMD ["httpd", "-D", "FOREGROUND"]