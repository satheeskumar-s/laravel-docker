FROM php:7.4-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html/laravel8

RUN chown laravel:laravel /var/www/html/laravel8

WORKDIR /var/www/html/laravel8

COPY . ./

RUN docker-php-ext-install pdo pdo_mysql
