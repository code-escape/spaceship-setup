#!/bin/bash
set -e

clear

echo "⚙️ - Update the image"
apt update -y
apt install wget gpg -y
apt install curl -y

echo "⚙️ - Install nginx"
apt install nginx -y
cp ./setup/nginx.conf /etc/nginx/sites-enabled/default
service nginx restart

echo "⚙️ - Install NodeJs"
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs

echo "⚙️ - Install NodeJs"
npm install -g pm2
npm install
pm2 start ecosystem.config.js

#KEYRING=/usr/share/keyrings/nodesource.gpg
#wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee "$KEYRING" >/dev/null
#gpg --no-default-keyring --keyring "$KEYRING" apt update && apt upgrade

#echo "⚙️ - Update the image"
#apt update
#apt install git ufw sudo wget gpg -y
#apt install -y --no-install-recommends apt-utils
#
#echo "⚙️ - Install nginx"
#{
#  apt install nginx -y
#  ufw allow 'Nginx HTTP'
#  service nginx start
#} 1>/dev/null
#
## Git
#echo "⚙️ - Install Git"
#{
#  git clone https://github.com/code-escape/spaceship-setup.git
#} 1>/dev/null
#
#echo "⚙️ - Install NodeJs"
#{
#  KEYRING=/usr/share/keyrings/nodesource.gpg
#  wget --quiet -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee "$KEYRING" >/dev/null
#  gpg --no-default-keyring --keyring "$KEYRING" --list-keyssudo apt update && apt upgrade
#} 1>/dev/null
#
