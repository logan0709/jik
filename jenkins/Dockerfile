FROM openjdk:8-jdk-alpine

RUN set -ex && \
    apk add ttf-dejavu git ca-certificates && \
    apk add --virtual .fetch-deps curl tar && \
    [ ! -e /etc/nsswitch.conf ] && echo ‘hosts: files dns‘ > /etc/nsswitch.conf

# docker指令支持 https://download.docker.com/linux/static/
RUN curl -fL -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-18.09.6.tgz && tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin/ && rm docker.tgz

# maven指令支持 http://mirror.bit.edu.cn/apache/maven/maven-3
RUN curl -fL -o maven.tar.gz http://mirror.bit.edu.cn/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz && tar -zxf maven.tar.gz -C /var/lib && rm -f maven.tar.gz
ADD settings.xml /var/lib/apache-maven-3.6.1/conf

# gradle指令支持
RUN curl -fL -o gradle.zip https://downloads.gradle-dn.com/distributions/gradle-5.6-bin.zip && unzip gradle.zip -d /var/lib && rm -f gradle.zip

# http://mirrors.jenkins-ci.org
RUN curl -fL -o jenkins.war http://mirrors.jenkins-ci.org/war/2.180/jenkins.war

ADD dockerd-entrypoint.sh /usr/local/bin
RUN chmod 777 /usr/local/bin/dockerd-entrypoint.sh && apk del .fetch-deps
VOLUME ["/var/jenkins_home"]
EXPOSE 8080
ENV JENKINS_HOME     /var/jenkins_home
ENV MAVEN_HOME       /var/lib/apache-maven-3.6.1
ENV GRADLE_HOME      /var/lib/gradle-5.6
ENV GRADLE_USER_HOME /var/jenkins_home/gradle/repo
ENV PATH=${PATH}:${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${GRADLE_HOME}/bin
CMD ["dockerd-entrypoint.sh","java","-jar","jenkins.war"]