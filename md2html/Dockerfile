FROM python:3.7-alpine
RUN pip install markdown
VOLUME /md
COPY md2html.py /
# docker run --rm -v /data/jik/md2html:/md test:1.0 md2html.py /md/k8s