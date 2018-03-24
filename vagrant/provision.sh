#!/usr/bin/env bash

# output kernel and distro info
uname -a
lsb_release -a

# update package indices, upgrade packages
sudo apt-get -q update
sudo apt-get -q upgrade -y
