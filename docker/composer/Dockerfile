FROM php-cli
LABEL maintainer "Vincent Falies <vincent@vfac.fr>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	wget \
	git

RUN wget https://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer config --global repo.packagist composer https://packagist.org

WORKDIR /var/www/html
