#!/bin/bash

###############################################
# Filename:    start-gemfire-local.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动  geode 本地服务
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants


. ${workspaces}/public_function.sh

load_profile

. ${workspaces}/gfsh-constants

start-gemfire-local(){
	echo "[info] 启动gemfire ${cfm_locator_name} 开始"
	echo "[info] 启动gemfire ${cfm_server_name} 开始"
${gfsh} <<EOF
${start_locator}
${start_server}
${list_members}
EOF
	echo "[info] 启动gemfire结果:>>>>>>>>> $?"
	echo '[info] 启动gemfire服务结束.........'
}

start-gemfire-local | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log

