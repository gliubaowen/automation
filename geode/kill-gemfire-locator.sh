#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    kill-gemfire-locator.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 杀掉 gemfire locator 服务
# Notes:       
# -------------------------------------------------------------------------------

kill-gemfire-locator(){
	echo '[info] kill-gemfire-locator服务开始.........'
	jps | grep LocatorLauncher | grep -v grep | cut -c 1-5 | xargs kill -9
	echo '[info] kill-gemfire-locator服务结束.........'
}

kill-gemfire-locator | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
