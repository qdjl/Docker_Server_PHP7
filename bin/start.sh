#!/bin/sh

if [ "$1" = "shell" ]; then
/bin/bash
exit 0
fi

if [ ! -d "/app/log" ]; then
mkdir /app/log
fi

if [ ! -d "/run/php" ]; then
mkdir /run/php
fi



/usr/sbin/php-fpm7.0 --nodaemonize -c /etc/php/7.0/fpm/php.ini --fpm-config /etc/php/7.0/fpm/php-fpm.conf
