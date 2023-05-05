ARG PHP_IMAGE=php:8.1-fpm
ARG COMPOSER_IMAGE=composer:2

FROM ${COMPOSER_IMAGE} as composer
FROM ${PHP_IMAGE} as php

# Install some common packages
RUN apt-get update && apt-get install -y \
    git \
    vim \
    nano \
    unzip \
    p7zip-full \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer /usr/bin/composer /usr/local/bin

# Install the install-php-extensions helper
RUN curl -sSLf \
    -o /usr/local/bin/install-php-extensions \
    https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions

# Install some common PHP Extensions
RUN install-php-extensions zip