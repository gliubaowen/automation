#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    kill-gemfire-server.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 杀掉 gemfire server 服务
# Notes:       
# -------------------------------------------------------------------------------

kill-gemfire-server(){
	echo '[info] kill-gemfire-server服务开始.........'
	jps | grep ServerLauncher | grep -v grep | cut -c 1-5 | xargs kill -9
	echo '[info] kill-gemfire-server服务结束.........'
}

kill-gemfire-server | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
