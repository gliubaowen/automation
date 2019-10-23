#!/bin/bash

###############################################
# Filename:    set-geode-properties-master.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 生成geode.properties配置文件
# Notes:       执行之前需检查 /opt/app/geode.properties 文件    
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

touch ${geodeConfig}
echo 'gemfire-locator-name=cfm-locator-master' > ${geodeConfig} 
echo 'gemfire-server-name=cfm-server-master' >> ${geodeConfig} 
echo 'host_master=V-CFM001' >> ${geodeConfig} 
echo 'host_slave=V-CFM002' >> ${geodeConfig} 
echo 'local_host=V-CFM001' >> ${geodeConfig} 

echo "[info] 修改后 ${geodeConfig} 的内容如下:>>>>>>>>>>>>>>"
cat ${geodeConfig}
