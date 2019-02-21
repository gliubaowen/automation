#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    kill-gemfire-all.sh 
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 杀掉 gemfire 所有服务
# Notes:       
# -------------------------------------------------------------------------------

kill-gemfire-all(){
	echo '[info] kill-gemfire服务开始.........'
	
	jps | grep ServerLauncher | grep -v grep | cut -c 1-5 | xargs kill -9
	jps | grep LocatorLauncher | grep -v grep | cut -c 1-5 | xargs kill -9
	
	echo '[info] kill-gemfire服务结束.........'
}

kill-gemfire-all | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
