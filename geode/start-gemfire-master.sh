#!/bin/bash

###############################################
# Filename:    start-gemfire-master.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 geode master 服务
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/gfsh-constants

start-gemfire-master(){
	echo '[info] 启动gemfire-master服务开始.........'
${gfsh} <<EOF
start locator --name=cfm-locator-master --port=10334 --dir=/opt/app/gemfire/ --mcast-port=0 --locators='V-CFM001[10334],V-CFM002[10334]';
start server --name=cfm-server-master --server-port=40405  --J=-XX:CMSInitiatingOccupancyFraction=80  --eviction-heap-percentage=75  --critical-heap-percentage=90  --max-threads=20000 --max-connections=10000 --disable-exit-when-out-of-memory=true --initial-heap=1024m --max-heap=3072m   --dir=/opt/app/gemfire/ --mcast-port=0 --locators='V-CFM001[10334],V-CFM002[10334]';
${list_members}
EOF
	echo "[info] 启动gemfire-master结果:>>>>>>>>> $?"
	echo '[info] 启动gemfire-master服务结束.........'
}

start-gemfire-master | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
