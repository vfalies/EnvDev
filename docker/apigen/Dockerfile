FROM php
LABEL maintainer "Vincent Falies <vincent.falies@gmail.com>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    php5 \
    php5-dev \
    wget \
    git

RUN wget https://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer config --global repo.packagist composer https://packagist.org


# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN composer global require apigen/apigen:4.1.2

ENTRYPOINT ["/root/.composer/vendor/bin/apigen"]
