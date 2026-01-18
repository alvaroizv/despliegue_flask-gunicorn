#!/bin/bash

set -xeu

apt-get update

apt-get -y upgrade

apt-get -y install nginx python3-pip python3-dev

mkdir -p /var/www/app

chown -R vagrant:www-data /var/www
chmod -R 775 /var/www

systemctl status nginx

cp /vagrant/app.conf /etc/nginx/sites-available/app.conf
cp /vagrant/flask_app.service /etc/systemd/system/flask_app.service
cp /vagrant/flask_azure.service /etc/systemd/system/flask_azure.service

ln -sf /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

systemctl daemon-reload
systemctl enable flask_app
systemctl enable flask_azure
systemctl enable nginx

