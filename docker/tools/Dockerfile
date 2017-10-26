FROM php
LABEL maintainer "Vincent Falies <vincent@vfac.fr>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    php5 \
    php5-dev \
    wget \
    git

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs

RUN wget https://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer config --global repo.packagist composer https://packagist.org

WORKDIR /var/www/html
