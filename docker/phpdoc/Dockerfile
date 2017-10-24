FROM php
LABEL maintainer "Vincent Falies <vincent.falies@gmail.com>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    graphviz

RUN wget https://github.com/phpDocumentor/phpDocumentor2/releases/download/v2.9.0/phpDocumentor.phar
RUN chmod +x phpDocumentor.phar
RUN cp phpDocumentor.phar /usr/local/bin/phpdoc

ENTRYPOINT ["phpdoc"]
