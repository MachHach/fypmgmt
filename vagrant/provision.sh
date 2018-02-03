#!/usr/bin/env bash

# output kernel and distro info
uname -a
lsb_release -a

# track newer PHP packages: https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo apt-add-repository ppa:ondrej/php

# update package indices, upgrade packages
sudo apt-get update
sudo apt-get upgrade

# install PHP 7.0, extensions: Multibyte, XML
sudo apt-get install -y php7.0-cli
sudo apt-get install -y php7.0-mbstring
sudo apt-get install -y php7.0-xml

# output PHP extension info: OpenSSL, PDO, Multibyte, Tokenizer, XML
php -v
php -i | grep -i -E 'openssl|pdo|multibyte|tokenizer|xml' | grep -i support | sed -e 's/^/PHP /'

# install Composer, make it available as command
curl -Ss https://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/composer
composer -V
