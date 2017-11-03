FROM ubuntu:16.10
MAINTAINER Flyrainning "http://www.fengpiao.net"


RUN apt-get update -y \
  && apt-get install -y \
    php-fpm \
    php-cli \
    php-imagick \
    php-json \
    php-mail \
    php-mbstring \
    php-mcrypt \
    php-memcached \
    php-mongodb \
    php-redis \
    php-ssh2 \
    php-xml \
    php-zip \
    php-curl \
    php-gd \
    php-mysql \
    php-odbc \
    php-sqlite3 \
    php-xmlrpc \
    php-sybase \
    cron \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*
    
ADD etc /etc
ADD app /app
ADD bin /bin
RUN chmod a+x /bin/start.sh
WORKDIR /app

ENV VERSION 1
ENV PATH "/app:$PATH"

EXPOSE 9000
ENTRYPOINT ["/bin/start.sh"]
