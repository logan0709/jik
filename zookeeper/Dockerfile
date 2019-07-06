FROM openjdk:8-jre-alpine

ENV ZK_DATA_DIR=/var/lib/zookeeper/data \
    ZK_DATA_LOG_DIR=/var/lib/zookeeper/log \
    ZK_LOG_DIR=/var/log/zookeeper

COPY zkGenConfig.sh zkOk.sh zkMetrics.sh /opt/zookeeper/bin/

ADD zookeeper.tar.gz /opt

RUN cp -r /opt/apache-zookeeper-3.5.5/*  /opt/zookeeper && \
    rm -rf \
    /opt/apache-zookeeper-3.5.5 \
    /opt/zookeeper/README.md \
    /opt/zookeeper/NOTICE.txt \
    /opt/zookeeper/LICENSE.txt \
    /opt/zookeeper/README_packaging.txt \
    /opt/zookeeper/build.xml \
    /opt/zookeeper/zookeeper-recipes \
    /opt/zookeeper/zookeeper-contrib \
    /opt/zookeeper/ivy.xml \
    /opt/zookeeper/ivysettings.xml \
    /opt/zookeeper/build.xml \
    /opt/zookeeper/excludeFindBugsFilter.xml \
    /opt/zookeeper/owaspSuppressions.xml \
    /opt/zookeeper/pom.xml \
    /opt/zookeeper/zookeeper-assembly \
    /opt/zookeeper/zookeeper-docs

RUN mkdir -p $ZK_DATA_DIR $ZK_DATA_LOG_DIR $ZK_LOG_DIR
RUN chown -R zookeeper:zookeeper $ZK_DATA_DIR $ZK_DATA_LOG_DIR $ZK_LOG_DIR /opt/zookeeper/bin