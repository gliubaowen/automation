#!/bin/bash

###############################################
# Filename:    stop-app.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 停止 CFM APP 服务 
# Notes:       
###############################################

stop-app(){
	
	echo '[info] 停止app服务开始.........'
su netty<<EOF
/opt/app/netty/stop-member-store-gateway.sh member/member-store-gateway member-store-gateway
EOF
	echo '[info] 停止app服务结束.........'
        
}

stop-app | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
