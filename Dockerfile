FROM ubuntu:18.04
MAINTAINER Flyrainning "http://www.fengpiao.net"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
  && apt-get install -y \
    openssl \
    unixodbc \
    php-fpm \
    php-cli \
    php-imagick \
    php-json \
    php-services-json \
    php-mail \
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
    php-odbc \
    php-sqlite3 \
    php-xmlrpc \
    php-sybase \
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

Run ACCEPT_EULA=Y dpkg -i /ext/msodbcsql17_17.2.0.1-1_amd64.deb

RUN chmod a+x /bin/start.sh
WORKDIR /app

ENV VERSION 1
ENV PATH "/app:$PATH"

EXPOSE 9000
ENTRYPOINT ["/bin/start.sh"]
