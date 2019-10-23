#!/bin/bash

###############################################
# Filename:    stop-gemfire-locator-local.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 geode 本地 locator 服务
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/public_function.sh

load_profile

. ${workspaces}/gfsh-constants

stop-gemfire-locator(){
	echo '[info] 停止gemfire-locator服务开始.........'
${gfsh} <<EOF
${connect}
${stop_locator}
${list_members}
EOF
	echo "[info] 停止gemfire-locator结果:>>>>>>>>> $?"
	echo '[info] 停止gemfire-locator服务结束.........'
}

stop-gemfire-locator | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
