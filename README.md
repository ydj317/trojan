# trojan


1. 执行 bbrplus.sh  选择 2  安装 bbrplus 然后重启
2. 执行 bbrplus.sh  选择 7  开启 bbrplus
3. 执行 dockersetup.sh 安装 docker 和 docker-compose
4. 把证书文件.crt 和 .key放到 这个脚本目录下，  文件名无所谓
5. 修改 nginx.conf 文件找到 <我的域名> 和 <我的服务器ip> 改为我自己的
6. 执行init.sh 结束


* config.json里有 默认的 trojan密码，可以先更改
* wordpress安装后因为是https下打开 需要修改两个文件
 /home/temp/wordpress/index.php 
  /home/temp/wordpress/wp-setting.php
  这两个文件 开头加上一行代码 $_SERVER['HTTPS'] = 'on';
