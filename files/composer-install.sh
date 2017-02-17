#!/bin/sh

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
wget -q https://getcomposer.org/installer -O composer-setup.php
WGET_ERR=$?
if [ "$WGET_ERR" != "0" ]; then
   echo "Failed to download installer, wget returned $WGET_ERR"
   exit 1
fi
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    echo "Expected: $EXPECTED_SIGNATURE"
    echo "Actual  : $ACTUAL_SIGNATURE"
    rm composer-setup.php
    exit 1
fi

php -d allow_url_fopen=1 composer-setup.php --filename=composer --install-dir=/usr/sbin/
RESULT=$?
if [ "$RESULT" != "0" ]; then
    echo "php composer-setup.php failed ..."
    rm composer-setup.php
fi
exit $RESULT
