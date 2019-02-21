#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    stop-gemfire-cluster.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 geode 集群 服务
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/gfsh-constants

. ${workspaces}/public_function.sh

stop-gemfire-master(){
	echo '[info] 停止gemfire-master服务开始.........'
${gfsh} <<EOF
${connect}
stop server --name=cfm-server-master
stop locator --name=cfm-locator-master
${list_members}
EOF
	echo "[info] 停止gemfire-master结果:>>>>>>>>> $?"
	echo '[info] 停止gemfire-master服务结束.........'
}

stop-gemfire-slave(){
	echo '[info] 停止gemfire-slave服务开始.........'
${gfsh} <<EOF
${connect}
stop server --name=cfm-server-slave
stop locator --name=cfm-locator-slave
${list_members}
EOF
	echo "[info] 停止gemfire-slave结果:>>>>>>>>> $?"
	echo '[info] 停止gemfire-slave服务结束.........'
}

stop-gemfire-cluster(){
	echo '[info] 停止gemfire-cluster服务开始.........'
	if [ $cfm_locator_name == "cfm-locator-master" ]; then
		stop-gemfire-slave
		stop-gemfire-master
	elif [ $cfm_locator_name == "cfm-locator-slave" ]; then
		stop-gemfire-master
		stop-gemfire-slave
	else 
		echo "[error] 配置文件：${appNameConfig} 错误"
		exit 1
	fi
	echo "[info] 停止gemfire-cluster结果:>>>>>>>>> $?"
	echo '[info] 停止gemfire-cluster服务结束.........'
}

load_profile

stop-gemfire-cluster | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
