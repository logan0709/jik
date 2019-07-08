FROM zookeeper:3.5
RUN rm -f /conf/zoo_sample.cfg && rm -f /docker-entrypoint.sh
COPY docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh