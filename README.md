# tencent cloud 轻量应用服务器 Lighthouse docker trojan 伪装


1. 执行 bbrplus.sh  选择 2  安装 bbrplus 然后重启
2. 执行 bbrplus.sh  选择 7  开启 bbrplus
3. 执行 dockersetup.sh 安装 docker 和 docker-compose
4. 把证书文件.crt 和 .key放到 这个脚本目录下，  文件名无所谓
5. 修改 nginx.conf 文件找到 <我的域名> 和 <我的服务器ip> 改为我自己的
6. 修改 config.json 里找到 password 这里设置的就是trojan密码
6. 执行init.sh 结束


* 如需自己修改配置文件的话 路径如下
* /home/temp/trojan/config.json 还有 /home/temp/nginx/nginx.conf
* 重启 命令
* docker restart nginx-1
* docker restart trojan-1
