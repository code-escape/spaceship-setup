#!/bin/bash
set -e
echo -e "\n\n⚙️ - Dans le script"
export DEBIAN_FRONTEND=noninteractive
export TERM=dumb
env

echo -e "\n\n⚙️ - Update the image"
sudo apt update -y
sudo apt install wget gpg -y
sudo apt install curl -y

echo -e "\n\n⚙️ - Install nginx"
sudo apt install nginx -y
sudo cp ./setup/nginx.conf /etc/nginx/sites-enabled/default
sudo service nginx restart

echo -e "\n\n⚙️ - Install NodeJs"
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash -
sudo apt-get install -y nodejs

echo -e "\n\n⚙️ - Install PM2"
npm install -g pm2
npm install
npm run build
pm2 start ecosystem.config.js
pm2 stop all

sudo rm -rf ./setup
sudo rm setup.sh

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
