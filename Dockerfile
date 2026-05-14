FROM php:5.6-apache

RUN sed -i 's|deb.debian.org/debian|archive.debian.org/debian|g; s|security.debian.org/debian-security|archive.debian.org/debian-security|g; /stretch-updates/d' /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until \
    && apt-get -o Acquire::AllowInsecureRepositories=true -o Acquire::AllowDowngradeToInsecureRepositories=true update \
    && apt-get install -y --allow-unauthenticated --no-install-recommends libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install mysql mysqli pdo_mysql mbstring gd \
    && rm -rf /var/lib/apt/lists/* \
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
