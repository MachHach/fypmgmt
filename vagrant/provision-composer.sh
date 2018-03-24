#!/usr/bin/env bash

echo "============ START: Install Composer ============"

# install Composer, make it available as command
sudo apt-get -q -y install unzip
curl -Ss https://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/composer

# output version
composer -V

echo "============ END: Install Composer ============"
