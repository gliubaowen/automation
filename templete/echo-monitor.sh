#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    echo-monitor.sh
# Version:     1.0
# Date:        2018-09-27
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 配置crontab /root/monitor.sh
# Notes:       
# -------------------------------------------------------------------------------

echo "*/1 * * * * root /bin/sh /root/monitor.sh  > /dev/null 2&>1" >> /etc/crontab

echo "修改后 /etc/crontab 的内容如下:>>>>>>>>>>>>>>"
cat /etc/crontab
