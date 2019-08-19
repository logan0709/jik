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

FROM ubuntu:16.04
VOLUME ["/docker/svn"]
RUN apt update
RUN apt-get install -y subversion
RUN apt-get install -y apache2

RUN mkdir -p /docker/svn/repostory \
&& svnadmin create /docker/svn/repostory \
&& chmod 777 /docker/svn -R \
&& mv /docker/svn/repostory/conf/authz /docker/svn/ \
&& mv /docker/svn/repostory/conf/passwd /docker/svn/

ADD 000-default.conf /etc/apache2/sites-available
ADD dav-svn.conf /etc/apache2/mods-available

EXPOSE 80
CMD ["service apache2 start"]