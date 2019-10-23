#!/bin/bash

###############################################
# Filename:    start-app.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动 CFM APP 服务 
# Notes:       
###############################################

start-app(){
	
	echo '[info] 重启app服务开始.........'
su netty<<EOF
/opt/app/netty/start-member-store-gateway.sh member/member-store-gateway member-store-gateway
EOF
	echo '[info] 重启app服务结束.........'

}

start-app | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
