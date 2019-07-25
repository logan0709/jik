FROM openjdk:8-jre-alpine

RUN apk add --virtual .fetch-deps curl unzip

# RUN curl -fL -o elasticsearch.zip https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}.zip \
#    && \
ADD elasticsearch-6.2.2.zip ./elasticsearch.zip
RUN unzip elasticsearch.zip -d /usr/share/ \
    && mv /usr/share/elasticsearch-6.2.2 /usr/share/elasticsearch \
    && rm -f elasticsearch.zip
#RUN curl -fL -o es-ik-plugins.zip https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.2/elasticsearch-analysis-ik-6.2.2.zip \
#    && unzip es-ik-plugins.zip -d /usr/share/elasticsearch/plugins/ik \
#    && rm -f es-ik-plugins.zip

RUN apk del .fetch-deps

WORKDIR /usr/share/elasticsearch
RUN adduser -S -G root elasticsearch
ENV ES_VERSION 6.2.2
ENV PATH /usr/share/elasticsearch/bin:$PATH
ADD docker-entrypoint.sh /usr/local/bin
#ADD IKAnalyzer.cfg.xml plugins/ik/config/

RUN mkdir -p /usr/share/elasticsearch/data
    && chown -R elasticsearch:root /usr/share/elasticsearch /usr/local/bin/docker-entrypoint.sh \
    && chmod u+x /usr/local/bin/docker-entrypoint.sh /usr/share/elasticsearch/bin/elasticsearch \
    && export ES_JAVA_OPTS='-Xms32m -Xmx32m';
USER elasticsearch
VOLUME /usr/share/elasticsearch/data
EXPOSE 9200 9300
ENTRYPOINT ["docker-entrypoint.sh"]