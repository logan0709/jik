FROM openjdk:8-jre-alpine

RUN apk add --virtual .fetch-deps curl unzip
# https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.2/elasticsearch-analysis-ik-6.2.2.zip
# https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.2.zip

ADD elasticsearch-6.2.2.zip ./elasticsearch.zip
RUN unzip elasticsearch.zip -d /usr/share/ \
    && mv /usr/share/elasticsearch-6.2.2 /usr/share/elasticsearch \
    && rm -f elasticsearch.zip

RUN apk del .fetch-deps

WORKDIR /usr/share/elasticsearch
RUN adduser -S -G root elasticsearch
ENV PATH /usr/share/elasticsearch/bin:$PATH
ENV ES_HOME=/usr/share/elasticsearch ES_TMPDIR=/usr/share/elasticsearch/tmp
ENV ES_JAVA_OPTS='-Xms32m -Xmx32m'
ENV cluster.name='elasticsearch-cluster'
ENV discovery.zen.ping.unicast.hosts='elasticsearch-discovery'
ENV node.master='true'
ENV node.data='true'

ADD docker-entrypoint.sh /usr/local/bin/

RUN mkdir -pv /usr/share/elasticsearch/{data,tmp} \
    && chown -R elasticsearch:root /usr/share/elasticsearch /usr/local/bin/docker-entrypoint.sh \
    && chmod -R 777 /usr/share/elasticsearch/data /usr/local/bin/docker-entrypoint.sh

USER elasticsearch
VOLUME /usr/share/elasticsearch/data
EXPOSE 9200 9300
#ENTRYPOINT ["elasticsearch"]
#-Ecluster.name=elasticsearch-cluster -Ediscovery.zen.ping.unicast.hosts=elasticsearch-discovery -Enode.master=true -Enode.data=true