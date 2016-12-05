FROM michieldewilde/docker-php-composer-alpine:7.0.13

Maintainer Michiel De Wilde <mich.dewild@gmail.com>

RUN apk --no-cache add bash python \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install xml

RUN composer global require hirak/prestissimo

COPY config/zzz-custom.ini /etc/php/conf.d/

ENTRYPOINT ["/bin/sh", "-c"]
