#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    export-gemfire-PosOrderOffline-data.sh
# Version:     2.0
# Date:        2018-10-19
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 导出 gemfire region 数据
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/public_function.sh

DATE=$(date +%Y-%m-%d-%H:%M:%S)
echo "[info] 导出的当前日期为:${DATE}"

BACKUP_DIR=/opt/app/gemfirebak/data/backup/posorderoffline-$(date +%Y-%m-%d)
echo "[info] 导出的当前目录为:${BACKUP_DIR}"

#配置文件
echo "[info] 配置文件为:${appNameConfig}"

export-gemfire-data(){

	if [ -d ${BACKUP_DIR} ] ; then
		sleep 2
		mkdir -p ${BACKUP_DIR}
	else 
		mkdir -p ${BACKUP_DIR}
	fi
		
	load_profile
${gfsh} << EOF
${connect}
${list_members}
${query_PosOrderOffline_count}
export data --region=PosOrderOffline --file=${BACKUP_DIR}/snapshot-PosOrderOffline.gfd --member=${cfm_server_name}
EOF
	
	echo "[info] 备份目录:${BACKUP_DIR} 备份后的文件为"
	ls -l ${BACKUP_DIR}

}

export-gemfire-data | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
