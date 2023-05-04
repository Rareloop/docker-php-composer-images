ARG PHP_IMAGE=php:8.1-fpm
ARG COMPOSER_IMAGE=composer:2

FROM ${COMPOSER_IMAGE} as composer
FROM ${PHP_IMAGE} as php

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer /usr/bin/composer /usr/local/bin