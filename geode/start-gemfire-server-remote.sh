#!/bin/bash

###############################################
# Filename:    start-gemfire-server-remote.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 geode 远程 server 服务
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/public_function.sh

start-gemfire-server-remote(){
	echo "[info] 启动gemfire server remote 开始"
	if [ $local_host == $host_master ]; then
		exec_host=$host_slave	
	elif [ $local_host == $host_slave ]; then
		exec_host=$host_master	
	else
		echo "[error] 配置文件：${geodeConfig} 错误"
		exit 1
	fi
	${workspaces}/ssh-cmd.sh $exec_host ${workspaces}/start-gemfire-server-local.sh	
	echo "[info] 启动gemfire server remote 结果:>>>>>>>>> $?"
	echo '[info] 启动gemfire server remote 服务结束.........'
}

load_profile

start-gemfire-server-remote | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
