#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo apt install php php-mysql -y
cd /var/www/html
echo "<h1>Welcome to 3-Tier App</h1>" > index.html

