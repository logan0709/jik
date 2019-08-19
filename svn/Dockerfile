FROM httpd
RUN apt-get update && apt-get install -y subversion mod_dav_svn
ADD subversion.conf /etc/httpd/conf.d

RUN mkdir -p /docker/svn \
    && \
    chmod 777 -R /docker/svn \
    && \
    {\
	    echo "LoadModule dav_svn_module modules/mod_dav_svn.so";\
		echo "LoadModule authz_svn_module modules/mod_authz_svn.so";\
	}>>/usr/local/apache2/conf/httpd.conf

EXPOSE 80
VOLUME ["/docker/svn"]

COPY authz /etc/httpd/conf
COPY passwd /etc/httpd/conf