FROM python:3.7-alpine
RUN pip install markdown
VOLUME /md
COPY md2html.py /
# docker run --rm -v $(pwd):/md md2html:1.0 python md2html.py /md/test