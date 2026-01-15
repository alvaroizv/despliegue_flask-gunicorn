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

cp /vagrant/flask_app.service /etc/systemd/system/flask_app.service

systemctl daemon-reload
systemctl enable flask_app
systemctl restart flask_app