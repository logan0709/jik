FROM docker.elastic.co/elasticsearch/elasticsearch:6.7.2
ADD config-ik.sh /usr/local/bin/
RUN apk add --virtual .fetch-deps curl unzip
RUN curl -fL -o es-ik-plugins.zip https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.7.2/elasticsearch-analysis-ik-6.7.2.zip
RUN unzip es-ik-plugins.zip -d plugins/ik \
    && rm -f es-ik-plugins.zip plugins/ik/config/IKAnalyzer.cfg.xml \
    && apk del .fetch-deps \
    && chown -R elasticsearch:elasticsearch /usr/local/bin/config-ik.sh