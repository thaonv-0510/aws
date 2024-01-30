#!/bin/bash

sudo apt update -y &&
sudo apt install -y nginx
touch /var/www/html/index.html
echo "<h1> Hello World from $(hostname -f) </h1>" > /var/www/html/index.html
