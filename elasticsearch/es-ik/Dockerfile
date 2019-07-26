FROM registry.cn-hangzhou.aliyuncs.com/weilus923/elasticsearch:6.2.2
RUN curl -fL -o es-ik-plugins.zip https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.2/elasticsearch-analysis-ik-6.2.2.zip

RUN elasticsearch-plugin remove ingest-geoip \
    && elasticsearch-plugin remove ingest-user-agent \
    && elasticsearch-plugin remove x-pack \
    && unzip es-ik-plugins.zip -d plugins \
    && mv plugins/elasticsearch plugins/ik \
    && rm -f es-ik-plugins.zip config/elasticsearch.keystore \
    && sed -i '$d' config/elasticsearch.yml \
    && sed -i '$d' /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/lib/security/java.policy
    && echo "permission java.net.SocketPermission \"*:*\", \"accept,connect,resolve\";};" >> /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/lib/security/java.policy

ADD IKAnalyzer.cfg.xml plugins/ik/config/
RUN chown -R root:root plugins/ik/config/IKAnalyzer.cfg.xml