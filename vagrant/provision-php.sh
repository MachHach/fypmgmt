#!/usr/bin/env bash

echo "============ START: Install PHP ============"

# track latest PHP packages: https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo apt-add-repository ppa:ondrej/php

# update package indices, upgrade packages
sudo apt-get -q update
sudo apt-get -q upgrade -y

# install PHP 7.0 + extensions for Multibyte, XML, FastCGI, PostgreSQL
# output PHP extension info: OpenSSL, PDO, Multibyte, Tokenizer, XML
sudo apt-get -q -y install php7.0-cli php7.0-mbstring php7.0-xml php7.0-fpm php7.0-pgsql
php -i | grep -i -E 'openssl|pdo|multibyte|tokenizer|xml' | grep -i support | sed -e 's/^/PHP /'

# PHP FastCGI security: disable smart path resolution
sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.0/fpm/php.ini
cat /etc/php/7.0/fpm/php.ini | grep cgi.fix_pathinfo=
sudo service php7.0-fpm restart

# output version
php -v

echo "============ END: Install PHP ============"
