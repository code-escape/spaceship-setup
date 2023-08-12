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
sudo npm install -g pm2
npm install
npm run build
pm2 start ecosystem.config.js
pm2 stop all

sudo rm -rf ./setup
sudo rm setup.sh
