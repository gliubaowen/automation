#!/bin/bash

###############################################
# Filename:    shutdown-gemfire.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 关闭 gemfire 服务,包括locator 
# Notes:       只会关闭相关联的一组集群
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/gfsh-constants

shutdown-gemfire(){

	echo '[info] 停止gemfire服务开始.........'
${gfsh} <<EOF
${connect}
${shutdown_include_locators}
EOF
	echo "[info] 停止gemfire结果:>>>>>>>>> $?"
	echo '[info] 停止gemfire服务结束.........'
        
}

shutdown-gemfire | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
