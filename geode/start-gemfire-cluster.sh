#!/bin/bash

###############################################
# Filename:    start-gemfire-cluster.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动  geode 集群
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/public_function.sh

start-gemfire-cluster(){
	${workspaces}/start-gemfire-locator-local.sh &
	${workspaces}/start-gemfire-locator-remote.sh
	${workspaces}/start-gemfire-server-local.sh &
	${workspaces}/start-gemfire-server-remote.sh
}

start-gemfire-cluster | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log

