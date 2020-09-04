#!/usr/bin/env bash

# Name: init
# Desc: 
# Date: 2020-04-16 by yongirl

clear

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Error: You must be root to run this script."
  exit 1
fi

# Header prompt
echo "================================================================================"
echo "init"
echo "================================================================================"


mkdir -p /home/temp/nginx
mkdir -p /home/temp/trojan/ssl

cp nginx.conf /home/temp/nginx/nginx.conf
cp config.json /home/temp/trojan/config.json

cp *.key /home/temp/trojan/ssl/server.key
cp *.crt /home/temp/trojan/ssl/server.crt


docker network create --subnet=172.30.0.0/24 network-1

docker run --name trojan-1 --restart=always --network network-1 --ip 172.30.0.10 -v /home/temp/trojan/config.json:/config/config.json:ro -v /home/temp/trojan/ssl:/config/ssl  -p 443:443 -d trojangfw/trojan

docker run --name nginx-1 --restart=always --network network-1  -v /home/temp/nginx/nginx.conf:/etc/nginx/nginx.conf:ro -p 80:80 -d nginx:1.19.2

docker run --name wordpress-1 --restart=always --network network-1 -v /home/temp/wordpress:/var/www/html -d wordpress:5.5.0-php7.2-apache
docker run --name mariadb-1 --restart=always --network network-1 -v /home/temp/mariadb/config:/etc/mysql/conf.d -v /home/temp/mariadb/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=a123123 -d mariadb:10.5.5-focal
docker run --name phpmyadmin-1 --restart=always --network network-1 -e PMA_HOST=mariadb-1 -p 8080:80 -d phpmyadmin

sed -i '1 a $_SERVER["HTTPS"] = "on";' /home/temp/wordpress/index.php
sed -i '1 a $_SERVER["HTTPS"] = "on";' /home/temp/wordpress/wp-settings.php


echo "set ok"

exit 0

