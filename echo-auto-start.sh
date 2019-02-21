#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    echo-auto-start.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 配置开机启动执行的脚本 /etc/rc.d/rc.local 
# Notes:       执行之前需要检查 /etc/rc.d/rc.local 文件内容
# -------------------------------------------------------------------------------

chmod 777 /etc/rc.local
chmod 777 /etc/rc.d/rc.local
echo '/usr/sbin/ntpdate -u 10.100.200.76' >> /etc/rc.d/rc.local
echo '/bin/bash /opt/app/automation/monitor-gemfire-cluster.sh' >> /etc/rc.d/rc.local
echo '/bin/bash /opt/app/automation/start-app.sh >> /opt/logs/CFM/start-app-$(date +%Y-%m-%d).log' >> /etc/rc.d/rc.local

ls -l /etc/rc.local
ls -l /etc/rc.d/rc.local
echo '[info] 修改后 /etc/rc.d/rc.local 的内容如下:>>>>>>>>>>>>>>'
cat /etc/rc.d/rc.local
