FROM openjdk:8-jdk-alpine

VOLUME /var/jenkins_home

RUN apk add ttf-dejavu

RUN apk add git

ADD dockerd-entrypoint.sh /usr/local/bin/

RUN apk add ca-certificates

RUN [ ! -e /etc/nsswitch.conf ] && echo ‘hosts: files dns‘ > /etc/nsswitch.conf

RUN set -ex;

RUN apk add --virtual .fetch-deps curl tar

#https://download.docker.com/linux/static/
RUN curl -fL -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-18.09.6.tgz
RUN tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin/ && rm docker.tgz

# http://mirrors.jenkins-ci.org
RUN curl -fL -o jenkins.war http://mirrors.jenkins-ci.org/war/2.180/jenkins.war

# http://mirror.bit.edu.cn/apache/maven/maven-3
RUN curl -fL -o maven.tar.gz http://mirror.bit.edu.cn/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
RUN tar -zxf maven.tar.gz -C /var/lib && rm -f maven.tar.gz

RUN apk del .fetch-deps

ENV JENKINS_HOME /var/jenkins_home
ENV MAVEN_HOME /var/lib/apache-maven-3.6.1
ENV PATH ${PATH}:${JAVA_HOME}/bin:${MAVEN_HOME}/bin

EXPOSE 8080

RUN chmod 777 /usr/local/bin/dockerd-entrypoint.sh

RUN rm -f ${MAVEN_HOME}/conf/settings.xml && \
    {\
        echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";\
        echo "<settings xmlns=\"http://maven.apache.org/SETTINGS/1.0.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd\">";\
        echo "<localRepository>/var/jenkins_home/maven/repo</localRepository>";\
        echo "<pluginGroups></pluginGroups><proxies></proxies><servers></servers><mirrors></mirrors><profiles></profiles>";\
        echo "</settings>";\
    }>>${MAVEN_HOME}/conf/settings.xml

ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh","java","-jar","jenkins.war"]

CMD ["sh"]