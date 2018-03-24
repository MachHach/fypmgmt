#!/usr/bin/env bash

echo "============ START: Install PostgreSQL ============"

# install and start PostgreSQL + utilities
# create DB, DB user, OS user
sudo apt-get -q -y install postgresql postgresql-contrib
sudo -u postgres createdb fypmgmt
sudo -u postgres createuser -S -D -R -E -w fypmgmt
sudo -u postgres psql -c "ALTER USER fypmgmt WITH PASSWORD 'fypmgmt';"
sudo adduser --disabled-password --gecos "" --quiet fypmgmt

# output version
psql -V

echo "============ END: Install PostgreSQL ============"
