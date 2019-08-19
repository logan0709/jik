#! /bin/bash
htpasswd -c -m /etc/httpd/conf/passwd admin
apachectl -k start
svnserve -d -r /docker/svn