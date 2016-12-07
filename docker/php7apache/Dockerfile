FROM php:7.0.13-apache
MAINTAINER Vincent Falies <vincent.falies@gmail.com>

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libsqlite3-dev \
    libssl-dev \
    libcurl3-dev \
    libxml2-dev \
    libzzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    wget \
    && docker-php-ext-install iconv json mcrypt mbstring mysqli pdo_mysql pdo_sqlite phar curl ftp hash session simplexml tokenizer xml xmlrpc zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

WORKDIR /var/www/html

CMD ["apache2-foreground"]
