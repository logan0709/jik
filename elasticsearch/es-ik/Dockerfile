FROM openjdk:8-jre-alpine

RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

ENV ES_VERSION 6.2.2
ENV PATH /usr/share/elasticsearch/bin:$PATH


RUN apk add --virtual .fetch-deps curl unzip

# RUN curl -fL -o elasticsearch.zip https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}.zip \
#    && \
ADD elasticsearch-6.2.2.zip ./elasticsearch.zip
RUN unzip elasticsearch.zip -d /usr/share/ \
    && mv /usr/share/elasticsearch-${ES_VERSION} /usr/share/elasticsearch \
    && rm -f elasticsearch.zip
RUN curl -fL -o es-ik-plugins.zip https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ES_VERSION}/elasticsearch-analysis-ik-${ES_VERSION}.zip \
    && unzip es-ik-plugins.zip -d /usr/share/elasticsearch/plugins/ik \
    && rm -f es-ik-plugins.zip

RUN apk del .fetch-deps

ADD docker-entrypoint.sh /usr/local/bin
WORKDIR /usr/share/elasticsearch
ADD IKAnalyzer.cfg.xml plugins/ik/config/

VOLUME /usr/share/elasticsearch/data
EXPOSE 9200 9300
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch /usr/local/bin/docker-entrypoint.sh && chmod u+x /usr/local/bin/docker-entrypoint.sh

#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
