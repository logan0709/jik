FROM registry.cn-hangzhou.aliyuncs.com/weilus923/elasticsearch:6.2.2
RUN curl -fL -o es-ik-plugins.zip https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.2/elasticsearch-analysis-ik-6.2.2.zip

RUN elasticsearch-plugin remove ingest-geoip ingest-user-agent x-pack \
    && unzip es-ik-plugins.zip -d plugins \
    && mv plugins/elasticsearch plugins/ik \
    && rm -f es-ik-plugins.zip

ADD IKAnalyzer.cfg.xml plugins/ik/config/
RUN chown -R root:root plugins/ik/config/IKAnalyzer.cfg.xml