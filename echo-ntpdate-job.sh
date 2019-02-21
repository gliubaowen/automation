#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    echo-ntpdate-job.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 配置同步时间的定时任务 
# Notes:       执行之前需要检查 /etc/crontab 文件内容
# -------------------------------------------------------------------------------

echo '* 05 * * * root /usr/sbin/ntpdate -u 10.100.200.76' >> /etc/crontab

echo '[info] 修改后 /etc/crontab 的内容如下:>>>>>>>>>>>>>>'
cat /etc/crontab
