FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    openssl \
    zip \
    unzip \
    libmcrypt-dev \
    libpq-dev \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick grpc \
    && docker-php-ext-enable imagick grpc \
    && docker-php-ext-install pdo mbstring pdo_pgsql pdo_mysql zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
