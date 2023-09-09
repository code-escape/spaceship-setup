#!/bin/bash
set -e
echo -e "\n\n⚙️ - Dans le script"
export DEBIAN_FRONTEND=noninteractive
export TERM=dumb

echo -e "\n\n⚙️ - Update the image"
sudo apt update -y
sudo apt install wget gpg -yq
sudo apt install curl -yq

echo -e "\n\n⚙️ - Install nginx"
sudo apt install nginx -y
sudo sed -i "s|include /etc/nginx/sites-enabled/\*;|include ${HOME}/nginx/\*;|g" /etc/nginx/nginx.conf
sudo mkdir -p ../nginx/
sudo cp ./setup/nginx.conf ../nginx/nginx.conf
sudo service nginx restart

echo -e "\n\n⚙️ - Install NodeJs"
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=18
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

echo -e "\n\n⚙️ - Install PM2"
sudo npm install -g pm2
npm install
npm run build
pm2 start ecosystem.config.js
pm2 stop all

echo -e "\n\n⚙️ - Clean the github refernence"
git remote rm origin

sudo rm -rf ./setup
