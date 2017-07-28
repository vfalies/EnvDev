FROM debian:stretch-slim
LABEL maintainer "Vincent Falies <vincent.falies@gmail.com>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl gnupg apt-transport-https \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get upgrade -y && apt-get install -y yarn

CMD ['/usr/bin/yarn']
