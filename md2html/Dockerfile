FROM python:3.7-alpine
RUN pip install markdown
VOLUME /md
COPY md2html.py /
# docker run --rm -v /data/jik/nginx-markdown/sss:/md test python md2html.py /md/k8s