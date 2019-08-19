#创建镜像
# docker build -t svn:1.0 .
#创建账号
# htpasswd -c -m /docker/svn/passwd admin
#配置权限
# vi /docker/svn/authz
#运行容器应用
#docker run -dit --name=SVN -v /docker/svn:/docker/svn -p 8843:80 --privileged=true svn:1.0
#仓库访问
#http://192.168.198.128:8843/svn/repostory/   输入admin+密码 访问svn仓库

FROM alpine:3.7
VOLUME ["/docker/svn"]
RUN apk add httpd subversion mod_dav_svn
RUN mkdir -p /docker/svn/repostory \
&& svnadmin create /docker/svn/repostory \
&& chmod 777 /docker/svn -R \
&& mv /docker/svn/repostory/conf/authz /docker/svn/ \
&& mv /docker/svn/repostory/conf/passwd /docker/svn/

# httpd+svn 用户认证
RUN {\
		echo "<Location /svn>";\
		echo "DAV svn";\
		echo "SVNParentPath /docker/svn";\
		echo "AuthType Basic";\
		echo "AuthName \"Authorization SVN\"";\
		echo "AuthzSVNAccessFile /docker/svn/authz";\
		echo "AuthUserFile       /docker/svn/passwd";\
		echo "Require valid-user";\
		echo "</Location>";\
	}>/etc/httpd/conf.d/subversion.conf

# 追加配置
RUN {\
	    echo "LoadModule dav_svn_module modules/mod_dav_svn.so";\
		echo "LoadModule authz_svn_module modules/mod_authz_svn.so";\
	}>>/etc/httpd/conf/httpd.conf

#编写启动脚本
RUN { \
		echo "#! /bin/bash"; \
		echo "apachectl -k start"; \
		echo "svnserve -d -r /docker/svn"; \
	}>/root/start.sh && chmod 777 /root/start.sh

EXPOSE 80
ENTRYPOINT sh /root/start.sh && /bin/bash