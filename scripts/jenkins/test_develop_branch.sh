#!/bin/sh

# install composer
cd ${WORKSPACE}
php ./composer.phar install

# execute phpunit
cd ${WORKSPACE}/
php ./vendor/bin/phpunit --log-tap=phpunit.tap ./test
