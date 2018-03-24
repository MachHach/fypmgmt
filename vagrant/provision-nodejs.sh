#!/usr/bin/env bash

echo "============ START: Install Node.js ============"

# track Node.js packages (Node.js 8 LTS)
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# update package indices, upgrade packages
sudo apt-get -q update
sudo apt-get -q upgrade -y

# install Node.js
sudo apt-get -q -y install nodejs

# output version
node -v

echo "============ END: Install Node.js ============"
