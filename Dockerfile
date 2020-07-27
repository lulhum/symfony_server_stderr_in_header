FROM php:7.4-fpm-alpine

RUN apk add --no-cache \
  git \
  curl \
  openssl \
  ssmtp \
  libzip-dev \
  bash

RUN docker-php-ext-install -j$(nproc) \
  pcntl \
  zip

RUN apk add --no-cache icu-dev
RUN docker-php-ext-install intl

RUN wget https://get.symfony.com/cli/installer -O - | bash \
    && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN curl https://raw.githubusercontent.com/composer/getcomposer.org/d3e09029468023aa4e9dcd165e9b6f43df0a9999/web/installer | php -- --quiet \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /app

ENV TZ="Europe/Paris"
ENV IS_DOCKER=1