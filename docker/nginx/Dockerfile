FROM nginx
MAINTAINER Vincent Falies <vincent.falies@gmail.com>

RUN apt-get update \
    && apt-get install curl

ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
