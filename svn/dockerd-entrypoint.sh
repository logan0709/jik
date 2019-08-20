#! /bin/sh
svnserve -d -r /svn/repo
httpd -D FOREGROUND