FROM python:3.7-alpine
RUN pip install markdown
VOLUME /md
COPY md2html.py /
RUN {\
        echo "#! /bin/sh";\
        echo "python md2html.py \"$@\"";\
    }>>/usr/local/bin/dockerd-entrypoint.sh && chmod 777 /usr/local/bin/dockerd-entrypoint.sh
ENTRYPOINT ["dockerd-entrypoint.sh"]
# docker run --rm -v $(pwd):/md md2html:1.0 /md/test