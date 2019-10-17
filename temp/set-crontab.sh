#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    echo-restart-app.sh
# Version:     1.0
# Date:        2018-09-27
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description:  
# Notes:       已经废弃，执行之前需要检查 /etc/crontab 文件内容
# -------------------------------------------------------------------------------

echo '* 05 * * * root /usr/sbin/ntpdate -u 10.100.200.76' >> /etc/crontab
echo "40 0  * * * root /bin/bash /home/netty/stop-app.sh > /dev/null 2&>1" >> /etc/crontab
echo "10 1  * * * root /bin/bash /home/netty/start-app.sh > /dev/null 2&>1" >> /etc/crontab

echo "修改后 /etc/crontab 的内容如下:>>>>>>>>>>>>>>"
cat /etc/crontab