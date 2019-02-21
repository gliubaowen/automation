#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    echo-appName.properties-slave.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 生成appName.properties配置文件
# Notes:       执行之前需检查 /opt/app/appName.properties 文件    
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

touch ${appNameConfig} 
echo 'gemfire-locator-name=cfm-locator-slave' > ${appNameConfig} 
echo 'gemfire-server-name=cfm-server-slave' >> ${appNameConfig} 
echo 'host_master=V-CFM001' >> ${appNameConfig} 
echo 'host_slave=V-CFM002' >> ${appNameConfig} 
echo 'local_host=V-CFM002' >> ${appNameConfig} 

echo "[info] 修改后 ${appNameConfig} 的内容如下:>>>>>>>>>>>>>>"
cat ${appNameConfig}
