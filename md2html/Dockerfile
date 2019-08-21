FROM python:3.7-alpine
RUN pip install markdown
VOLUME /md
COPY md2html.py /
CMD ["python","md2html.py","/md/${file}"]
# docker run --rm -v $(pwd):/md -e file=test md2html:1.0