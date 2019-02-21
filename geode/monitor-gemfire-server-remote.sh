#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    monitor-gemfire-server-remote.sh 
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 监听 gemfire server 远程服务
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/public_function.sh

monitor-gemfire-server-remote(){
	
	load_profile
	echo "monitor gemfire server remote 开始"
	if [ $local_host == $host_master ]; then
		exec_host=$host_slave	
	elif [ $local_host == $host_slave ]; then
		exec_host=$host_master	
	else
		echo "配置文件：${appNameConfig} 错误"
		exit 1
	fi
	${workspaces}/ssh-cmd.sh $exec_host ${workspaces}/monitor-gemfire-server-local.sh	
	echo "monitor gemfire server remote 结果:>>>>>>>>> $?"
	echo 'monitor gemfire server remote 服务结束.........'
}

monitor-gemfire-server-remote | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log

