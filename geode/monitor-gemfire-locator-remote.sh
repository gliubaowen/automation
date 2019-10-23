#!/bin/bash

###############################################
# Filename:    monitor-gemfire-locator-remote.sh 
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 监听 gemfire locator 远程服务
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/public_function.sh

monitor-gemfire-locator-remote(){
	
	load_profile
	echo "[info] monitor gemfire locator remote 开始"
	if [ $local_host == $host_master ]; then
		exec_host=$host_slave	
	elif [ $local_host == $host_slave ]; then
		exec_host=$host_master	
	else
		echo "[error] 配置文件：${geodeConfig} 错误"
		exit 1
	fi
	${workspaces}/ssh-cmd.sh $exec_host ${workspaces}/monitor-gemfire-locator-local.sh	
	echo "[info] monitor gemfire locator remote 结果:>>>>>>>>> $?"
	echo '[info] monitor gemfire locator remote 服务结束.........'
}

monitor-gemfire-locator-remote | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
