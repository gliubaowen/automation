#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    start-gemfire-slave.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 geode slave 服务
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/gfsh-constants

start-gemfire-slave(){
	echo '[info] 启动gemfire-slave服务开始.........'
${gfsh} <<EOF
start locator --name=cfm-locator-slave --port=10334 --dir=/opt/app/gemfire/ --mcast-port=0 --locators='V-CFM001[10334],V-CFM002[10334]';
start server --name=cfm-server-slave --server-port=40405 --J=-XX:CMSInitiatingOccupancyFraction=80  --eviction-heap-percentage=75  --critical-heap-percentage=90   --max-threads=20000 --max-connections=10000 --disable-exit-when-out-of-memory=true  --initial-heap=1024m --max-heap=3072m  --dir=/opt/app/gemfire/ --mcast-port=0 --locators='V-CFM001[10334],V-CFM002[10334]';
${list_members}
EOF
	echo "[info] 启动gemfire-slave结果:>>>>>>>>> $?"
	echo '[info] 启动gemfire-slave服务结束.........'
}

start-gemfire-slave | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
