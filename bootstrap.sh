#!/bin/bash

apt-get update
apt-get install -y nginx
rm -rf /var/www
ln -fs /vagrant /var/www
