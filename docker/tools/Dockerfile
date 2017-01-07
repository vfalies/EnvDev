FROM debian:jessie-slim
MAINTAINER Vincent Falies <vincent.falies@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    php5 \
    wget

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g bower \
    && npm install -g grunt

RUN wget https://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer config --global repo.packagist composer https://packagist.org

WORKDIR /var/www/html
