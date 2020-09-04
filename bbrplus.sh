#!/usr/bin/env bash

# Name: bbr plus
# Desc: bbr plus
# Date: 2020-04-16 by yongirl

clear

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Error: You must be root to run this script."
  exit 1
fi

# Header prompt
echo "================================================================================"
echo "bbr plus install"
echo "================================================================================"

if [ -s /home/downloads/tcp.sh ]; then
  /home/downloads/tcp.sh
  exit 0
fi

mkdir -p /home/downloads

wget -P /home/downloads -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" 

chmod +x /home/downloads/tcp.sh
/home/downloads/tcp.sh


