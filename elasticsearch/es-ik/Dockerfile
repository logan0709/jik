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
ENV ES_JAVA_OPTS='-Xms32m -Xmx32m' cluster.name='elasticsearch-cluster' discovery.zen.ping.unicast.hosts='elasticsearch-discovery' node.master='true' node.data='true'

RUN mkdir -pv /usr/share/elasticsearch/{data,tmp} \
    && chown -R elasticsearch:root /usr/share/elasticsearch /usr/local/bin/docker-entrypoint.sh \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh /usr/share/elasticsearch/bin/elasticsearch

USER elasticsearch
VOLUME /usr/share/elasticsearch/data
EXPOSE 9200 9300
#ENTRYPOINT ["elasticsearch"]