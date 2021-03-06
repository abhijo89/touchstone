#!/bin/bash

# update apt repos
sudo apt-get update

# install nginx
sudo apt-get install nginx htop -y

# soft link the upstart job files
PWD=`pwd`
mkdir /etc/nginx/ssl
sudo cp -f $PWD/encoder /etc/nginx/sites-available/
sudo cp -f $PWD/server* /etc/nginx/ssl/
sudo ln -s -f /etc/nginx/sites-available/encoder /etc/nginx/sites-enabled/encoder
sudo rm /etc/nginx/sites-enabled/default

# start nginx
sudo service nginx start
