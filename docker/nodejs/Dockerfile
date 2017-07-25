FROM php
LABEL maintainer "Vincent Falies <vincent.falies@gmail.com>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs
