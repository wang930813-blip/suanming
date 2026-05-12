FROM php:5.6-apache

RUN docker-php-ext-install mysql mysqli pdo_mysql mbstring \
    && a2enmod rewrite headers

COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf
COPY docker/php.ini /usr/local/etc/php/conf.d/suanming.ini
COPY docker/entrypoint.sh /usr/local/bin/suanming-entrypoint

WORKDIR /var/www/html
COPY . /var/www/html

RUN chmod +x /usr/local/bin/suanming-entrypoint \
    && chown -R www-data:www-data /var/www/html/data /var/www/html/static /var/www/html/access_token.json /var/www/html/jsapi_ticket.json || true

ENTRYPOINT ["suanming-entrypoint"]
CMD ["apache2-foreground"]
