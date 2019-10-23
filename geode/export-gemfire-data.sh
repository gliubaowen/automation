#!/bin/bash

###############################################
# Filename:    export-gemfire-data.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 导出 gemfire region 数据
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/public_function.sh

DATE=$(date +%Y-%m-%d-%H:%M:%S)
echo "[info] 导出的当前日期为:${DATE}"

BACKUP_DIR=/opt/app/gemfirebak/data/backup/${DATE}
echo "[info] 导出的当前目录为:${BACKUP_DIR}"

#配置文件
echo "[info] 配置文件为:${geodeConfig}"

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
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
export data --region=MemberStatusComposite --file=${BACKUP_DIR}/snapshot-MemberStatusComposite.gfd --member=${cfm_server_name}
export data --region=MemberMgtLevel --file=${BACKUP_DIR}/snapshot-MemberMgtLevel.gfd --member=${cfm_server_name}
export data --region=OrgStores --file=${BACKUP_DIR}/snapshot-OrgStores.gfd --member=${cfm_server_name}
export data --region=ProductsNRate --file=${BACKUP_DIR}/snapshot-ProductsNRate.gfd --member=${cfm_server_name}
export data --region=MemberTicketData --file=${BACKUP_DIR}/snapshot-MemberTicketData.gfd --member=${cfm_server_name}
export data --region=PosOrderOffline --file=${BACKUP_DIR}/snapshot-PosOrderOffline.gfd --member=${cfm_server_name}
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
EOF
	
	echo "[info] 备份目录:${BACKUP_DIR} 备份后的文件为"
	ls -l ${BACKUP_DIR}

}

export-gemfire-data | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
