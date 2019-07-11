FROM alpine:3.5

ENV NGINX_VERSION 1.16.0

COPY ngx-markdown-module /

RUN apk add curl tar
RUN curl -fO nginx-${NGINX_VERSION}.tar.gz http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
RUN tar -zxf nginx-${NGINX_VERSION}.tar.gz -C / && rm -f nginx-${NGINX_VERSION}.tar.gz
RUN apk del curl tar

WORKDIR nginx-${NGINX_VERSION}
RUN ./configure \
    --add-module /ngx-markdown-module/ngx-md-filter-module \
    --add-module /ngx-markdown-module/ngx-md-handler-module \
    && make \
    && make install

