FROM php:7.3.6-fpm-alpine3.9

WORKDIR /var/www

RUN apk add --no-cache openssl bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN rm -rf /var/www/html

COPY . /var/www

RUN ln -s public html
RUN chmod o+w -R storage

EXPOSE 9000

ENTRYPOINT ["php-fpm"]