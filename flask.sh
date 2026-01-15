#!/bin/bash

set -xeu

apt-get update

apt-get -y upgrade

apt-get -y install nginx python3-pip python3-dev

mkdir -p /var/www/app

chown -R vagrant:www-data /var/www/app
chmod -R 775 /var/www/app

systemctl start nginx
systemctl status nginx

systemctl daemon-reload