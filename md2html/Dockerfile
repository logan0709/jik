FROM python:3.7-alpine
RUN pip install markdown
VOLUME /md
COPY md2html.py /
COPY dockerd-intrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/dockerd-entrypoint.sh
ENTRYPOINT ["dockerd-entrypoint.sh"]
# docker run --rm -v $(pwd):/md md2html:1.0 /md/test