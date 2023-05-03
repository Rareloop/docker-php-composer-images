ARG PHP_IMAGE=php:8.1-fpm
ARG COMPOSER_IMAGE=composer:2

FROM ${COMPOSER_IMAGE} as composer
FROM ${PHP_IMAGE} as php

COPY --from=composer /usr/bin/composer /usr/local/bin