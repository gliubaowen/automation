#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    stop-cfm-local.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 关闭 cfm-app 和 gemfire local 服务 
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

stop-cfm-local(){
	echo '[info] 停止 cfm-app 和 gemfire local 服务开始.........'
	bash ${workspaces}/stop-app.sh
	bash ${workspaces}/stop-gemfire-local.sh
	echo '[info] 停止 cfm-app 和 gemfire local 服务结束.........'
}

stop-cfm-local | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
