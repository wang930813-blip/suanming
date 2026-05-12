#!/bin/sh
set -e

mkdir -p /var/www/html/data/cache /var/www/html/data/log /var/www/html/static/uploads
chown -R www-data:www-data \
    /var/www/html/data \
    /var/www/html/static \
    /var/www/html/access_token.json \
    /var/www/html/jsapi_ticket.json 2>/dev/null || true

exec docker-php-entrypoint "$@"
