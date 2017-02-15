FROM debian:jessie-slim
LABEL maintainer "Vincent Falies <vincent.falies@gmail.com>"

RUN apt-get update && apt-get install -y \
    apache2

RUN a2enmod proxy \
    && a2enmod proxy_fcgi \
    && a2enmod rewrite

COPY fcgi.conf /tmp/fcgi.conf
RUN cat /tmp/fcgi.conf >> /etc/apache2/apache2.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
