#!/usr/bin/env bash

# output kernel and distro info
uname -a
lsb_release -a

# track latest PHP packages: https://launchpad.net/~ondrej/+archive/ubuntu/php
sudo apt-add-repository ppa:ondrej/php

# track latest NGINX packages (open source, stable, Ubuntu Trusty)
sudo wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
sudo sed -i '$a deb http://nginx.org/packages/ubuntu/ trusty nginx' /etc/apt/sources.list
sudo sed -i '$a deb-src http://nginx.org/packages/ubuntu/ trusty nginx' /etc/apt/sources.list
sudo apt-get -q remove nginx-common

# update package indices, upgrade packages
sudo apt-get -q update
sudo apt-get -q upgrade

# install PHP 7.0 + extensions for Multibyte, XML, FastCGI, PostgreSQL
# output PHP extension info: OpenSSL, PDO, Multibyte, Tokenizer, XML
sudo apt-get -q -y install php7.0-cli php7.0-mbstring php7.0-xml php7.0-fpm php7.0-pgsql
php -i | grep -i -E 'openssl|pdo|multibyte|tokenizer|xml' | grep -i support | sed -e 's/^/PHP /'

# PHP FastCGI security: disable smart path resolution
sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.0/fpm/php.ini
cat /etc/php/7.0/fpm/php.ini | grep cgi.fix_pathinfo=
sudo service php7.0-fpm restart

# install Composer, make it available as command
sudo apt-get -q -y install unzip
curl -Ss https://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/composer

# install and start PostgreSQL + utilities
# create DB, DB user, OS user
sudo apt-get -q -y install postgresql postgresql-contrib
sudo -u postgres createdb fypmgmt
sudo -u postgres createuser -S -D -R -E -w fypmgmt
sudo -u postgres psql -c "ALTER USER fypmgmt WITH PASSWORD 'fypmgmt';"
sudo adduser --disabled-password --gecos "" --quiet fypmgmt

# install and start NGINX
sudo apt-get -q -y install nginx-full
sudo service nginx start

# output version
php -v
composer -V
psql -V
nginx -v

# grant full permission to "www-data" user (web server), for folders "storage" and "bootstrap/cache"
sudo chgrp -R www-data /var/www/html/fypmgmt/storage
sudo chgrp -R www-data /var/www/html/fypmgmt/bootstrap/cache
sudo chmod -R ug+rwx /var/www/html/fypmgmt/storage
sudo chmod -R ug+rwx /var/www/html/fypmgmt/bootstrap/cache

# configure and restart NGINX
sudo cp /var/www/html/fypmgmt/vagrant/localhost.conf /etc/nginx/sites-available/localhost
sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default-disabled
sudo service nginx restart
