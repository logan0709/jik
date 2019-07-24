FROM openjdk:8-jre-alpine

RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

ENV ES_VERSION 6.2.2
ENV PATH /usr/share/elasticsearch-${ES_VERSION}/bin:${PATH}
WORKDIR /usr/share/elasticsearch-${ES_VERSION}

RUN apk add --virtual .fetch-deps curl unzip

RUN curl -fL -o elasticsearch.zip https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}.zip \
    && unzip elasticsearch.zip -d /usr/share/ \
    && rm -f elasticsearch.zip
RUN curl -fL -o es-ik-plugins.zip https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ES_VERSION}/elasticsearch-analysis-ik-${ES_VERSION}.zip \
    && unzip es-ik-plugins.zip -d plugins/ik \
    && rm -f es-ik-plugins.zip

RUN apk del .fetch-deps

ADD docker-entrypoint.sh /usr/local/bin
ADD IKAnalyzer.cfg.xml plugins/ik/config/
ENTRYPOINT ["docker-entrypoint.sh"]