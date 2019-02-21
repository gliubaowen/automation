#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    stop-gemfire-local.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 geode 本地服务
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/public_function.sh

load_profile

. ${workspaces}/gfsh-constants

stop-gemfire-local(){
	echo '[info] 停止gemfire-local服务开始.........'
${gfsh} <<EOF
${connect}
${stop_server}
${stop_locator}
${list_members}
EOF
	echo "[info] 停止gemfire-local结果:>>>>>>>>> $?"
	echo '[info] 停止gemfire-local服务结束.........'
}

stop-gemfire-local | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
