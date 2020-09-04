#!/usr/bin/env bash

# Name: docker
# Desc: 安装DOCKER
# Date: 2020-04-16 by yongirl

clear

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Error: You must be root to run this script."
  exit 1
fi

# Header prompt
echo "================================================================================"
echo "docker install"
echo "================================================================================"


#删除旧版
yum remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-engine


# 依赖库 安装
yum -y install yum-utils \
device-mapper-persistent-data \
lvm2

# yum仓库源安装
yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo

#安装 docker
yum -y install docker-ce docker-ce-cli containerd.io

systemctl enable docker
systemctl start docker 

curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

echo "set ok"

exit 0
