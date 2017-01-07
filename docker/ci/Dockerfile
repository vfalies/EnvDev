FROM debian
MAINTAINER Vincent Falies <vincent.falies@gmail.com>

RUN apt-get update && apt-get install -y \
    wget \
    php5-dev

RUN wget https://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

RUN composer config --global repo.packagist composer https://packagist.org \
    && composer global require squizlabs/php_codesniffer \
    && composer global require phpunit/phpunit \
    && composer global require sebastian/phpcpd \
    && composer global require phing/phing \
    && composer global require phpmd/phpmd \
    && composer global require pdepend/pdepend \
    && composer global require phpmetrics/phpmetrics

ENV PATH /root/.composer/vendor/bin:$PATH

RUN mkdir /ci
ADD build.xml /ci/build.xml
ADD ci.sh /ci/ci.sh
ADD git-precommit-hook.sh /ci/git-precommit-hook.sh
ADD git-prepush-hook.sh /ci/git-prepush-hook.sh
RUN chmod +x /ci/ci.sh /ci/git-precommit-hook.sh /ci/git-prepush-hook.sh

RUN mkdir /root/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/EnvDev
ADD ruleset.xml /root/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/EnvDev/ruleset.xml

WORKDIR /app
