FROM alpine:3.5
RUN apk update && apk add apache2 apache2-utils apache2-webdav subversion mod_dav_svn
ADD subversion.conf /etc/apache2/conf.d
ADD dockerd-entrypoint.sh /usr/bin
ENV APACHE_RUN_USER=root APACHE_RUN_GROUP=root APACHE_LOG_DIR=/var/log/apache2
RUN mkdir -p /svn/repo /run/apache2 /etc/apache2/auth && chmod 777 -R /svn/repo /usr/bin/dockerd-entrypoint.sh
EXPOSE 80
VOLUME ["/svn/repo","/etc/apache2/auth","/var/log/apache2"]
WORKDIR /etc/apache2
ENTRYPOINT ["dockerd-entrypoint.sh"]