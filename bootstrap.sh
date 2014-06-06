#!/bin/sh
apt-get -y update
apt-get install -y vim python-pip python-virtualenv nginx 
mkdir /usr/local/dev
rsync /vagrant/* /usr/local/dev/
virtualenv --no-site-packages /usr/local/dev
cd /usr/local/dev && source bin/activate
pip install flask gunicorn
chown -R vagrant.vagrant /usr/local/dev
echo 'server { location / { proxy_pass http://127.0.0.1:8080; } }' >/etc/nginx/sites-available/dev
ln -s /etc/nginx/sites-available/dev /etc/nginx/sites-enabled/dev
service nginx start
