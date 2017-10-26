FROM php
LABEL maintainer "Vincent Falies <vincent@vfac.fr>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    php5 \
    php5-dev \
    wget \
    git

RUN curl -LO https://deployer.org/deployer.phar \
    && mv deployer.phar /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep

WORKDIR /app

ENTRYPOINT ["dep"]
