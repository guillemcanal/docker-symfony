FROM alpine:3.6

LABEL maintainer="Vincent Composieux <vincent.composieux@gmail.com>"

RUN apk add --update \
    php7-fpm \
    php7-apcu \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-imagick \
    php7-json \
    php7-intl \
    php7-mcrypt \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-xml \
    php7-zlib \
    php7-phar \
    php7-tokenizer \
    php7-session \
    php7-xdebug \
    make \
    curl

RUN rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && rm /etc/php7/php-fpm.d/* \
    && mkdir -p /var/log/php \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data

RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

COPY symfony.ini /etc/php7/php-fpm.d/symfony.ini
COPY symfony.ini /etc/php7/cli/conf.d/symfony.ini

COPY symfony.pool.conf /etc/php7/php-fpm.d/symfony.pool.conf

CMD ["php-fpm7", "-F"]

WORKDIR /var/www
EXPOSE 9000
