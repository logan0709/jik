FROM docker.elastic.co/elasticsearch/elasticsearch:6.7.2
RUN curl -fL -o es-ik-plugins.zip https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.7.2/elasticsearch-analysis-ik-6.7.2.zip
RUN unzip es-ik-plugins.zip -d plugins/ik && rm -f es-ik-plugins.zip
ADD IKAnalyzer.cfg.xml plugins/ik/config/
RUN chown -R root:root plugins/ik/config/IKAnalyzer.cfg.xml