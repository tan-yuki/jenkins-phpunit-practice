#!/bin/sh

CHATWORK_API_TOKEN=bcdaa937f8b3cfb986cba8b6ee5d8dbd
ROOM_ID=16535451

# install composer
cd ${WORKSPACE}
php ./composer.phar install

# execute phpunit
cd ${WORKSPACE}/
php ./vendor/bin/phpunit --log-junit=phpunit-result.xml ./test

if [ $? -ne 0 ]; then
  body=<<_EOF_
Failed your test!
_EOF_
  curl -X POST -H "X-ChatWorkToken: ${CHATWORK_API_TOKEN}" -d "body=${body}" "https://api.chatwork.com/v1/rooms/${ROOM_ID}/messages"
fi
