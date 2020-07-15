FROM php:7.4-fpm-alpine
RUN apk add --no-cache shadow
RUN apk add bash nano

RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data
USER www-data

COPY . /var/www

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
