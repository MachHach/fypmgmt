#!/usr/bin/env bash

echo "============ START: Install NGINX ============"

# track latest NGINX packages (open source, stable, Ubuntu Trusty)
sudo wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key
sudo sed -i '$a deb http://nginx.org/packages/ubuntu/ trusty nginx' /etc/apt/sources.list
sudo sed -i '$a deb-src http://nginx.org/packages/ubuntu/ trusty nginx' /etc/apt/sources.list
sudo apt-get -q remove nginx-common

# update package indices, upgrade packages
sudo apt-get -q update
sudo apt-get -q upgrade -y

# install and start NGINX
sudo apt-get -q -y install nginx-full
sudo service nginx start

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

# output version
nginx -v

echo "============ END: Install NGINX ============"
