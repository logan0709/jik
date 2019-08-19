FROM centos:6.7
RUN yum install -y httpd subversion mod_dav_svn
RUN mkdir -p /docker/svn
    && chmod 777 -R /docker/svn
    && {\
	    echo "LoadModule dav_svn_module modules/mod_dav_svn.so";\
		echo "LoadModule authz_svn_module modules/mod_authz_svn.so";\
	}>>/etc/httpd/conf/httpd.conf

ADD subversion.conf /etc/httpd/conf.d
ADD dockerd-entrypoint.sh /usr/local/bin

EXPOSE 80
VOLUME ["/docker/svn"]
ENTRYPOINT ["dockerd-entrypoint.sh"]