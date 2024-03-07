#!/bin/bash

if [ ! -f "vendor/autoload.php" ]; then
    composer install
fi

# php artisan migrate
php artisan clear
php artisan optimize:clear

php artisan octane:frankenphp --max-requests=1