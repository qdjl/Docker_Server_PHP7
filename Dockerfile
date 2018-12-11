FROM ubuntu:18.04
MAINTAINER Flyrainning "http://www.fengpiao.net"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
  && apt-get install -y \
    openssl \
    gnupg \
    curl


RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update -y \
  && ACCEPT_EULA=Y apt-get install -y \
    msodbcsql17 \
    php-fpm \
    php-cli \
    php-imagick \
    php-json \
    php-services-json \
    php-mail \
    php-odbc \
    php-mbstring \
    php-memcached \
    php-mongodb \
    php-redis \
    php-xml \
    php-zip \
    php-ssh2 \
    php-curl \
    php-gd \
    php-mysql \
    php-sqlite3 \
    php-xmlrpc \
    php-amqp \
    php-geos \
    php-http-request \
    php-log \
    php-markdown \
    php-net-socket \
    php-pgsql \
    php-yaml \
    cron \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

ADD etc /etc
ADD app /app
ADD bin /bin
ADD ext /ext


RUN chmod a+x /bin/start.sh
WORKDIR /app

ENV VERSION 1
ENV PATH "/app:$PATH"

EXPOSE 9000
ENTRYPOINT ["/bin/start.sh"]
