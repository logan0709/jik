#! /bin/bash
ls /usr/bin
echo '/usr/bin/svnserve -d -r /svn/repo'
/usr/bin/svnserve -d -r /svn/repo
echo 'httpd -D FOREGROUND'
httpd -D FOREGROUND