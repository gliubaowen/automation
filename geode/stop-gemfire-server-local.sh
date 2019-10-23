#!/bin/bash

###############################################
# Filename:    stop-gemfire-server-local.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 geode 本地 server 服务
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/public_function.sh

load_profile

. ${workspaces}/gfsh-constants

stop-gemfire-server(){
	echo '[info] 停止gemfire-server服务开始.........'
${gfsh} <<EOF
${connect}
${stop_server}
${list_members}
EOF
	echo "[info] 停止gemfire-server结果:>>>>>>>>> $?"
	echo '[info] 停止gemfire-server服务结束.........'
}

stop-gemfire-server | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
