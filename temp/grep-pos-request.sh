#!/bin/bash


###############################################
# Filename:    grep-pos-request.sh 
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 
# Notes:       
###############################################


#log-dir
log_dir='/opt/logs/netty/member/member-store-gateway/'

file_name_prefix=member-store-gateway

file_name_suffix=log.gz

pos_request="pos-request-`hostname`"
echo "[info] pos_request: ${pos_request}"
#当前系统时间
CURRENTDATE=$(date +%Y-%m-%d)
#当前系统时间戳
TIMESTAMP=$(date +%s)
 
grep-logfile(){
	touch ${log_dir}${pos_request}
	cd $'log_dir'
	echo "[info] 抽取离线交易数据 `pwd` 开始"
	for file in `ls | grep member-store-gateway_201`
	do
		echo "log file : ${file}"
		less ${file} | grep -F "savePosRequestContents" >> ${pos_request}
	done
	echo "[info] 抽取离线交易数据  结束"
}

#执行函数
grep-logfile
