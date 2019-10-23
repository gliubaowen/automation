#!/bin/bash

###############################################
# Filename:    import-gemfire-data.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 导入gemfire region数据
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/public_function.sh

if [ $# -lt 1 ]
    then
    echo "USAGE:$0 USAGE|BACKUP_DIR"
    exit 1
fi

backup_dir=$1

import-gemfire-data(){
		
	load_profile
	
echo "[info] 需要还原数据的目录为:${backup_dir}"
	
ls -l ${backup_dir}/
	
${gfsh} << EOF
${connect}
${list_members}
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
import data --region=MemberStatusComposite --file=${backup_dir}snapshot-MemberStatusComposite.gfd --member=${cfm_server_name}
import data --region=MemberMgtLevel --file=${backup_dir}snapshot-MemberMgtLevel.gfd --member=${cfm_server_name}
import data --region=OrgStores --file=${backup_dir}snapshot-OrgStores.gfd --member=${cfm_server_name}
import data --region=ProductsNRate --file=${backup_dir}snapshot-ProductsNRate.gfd --member=${cfm_server_name}
import data --region=MemberTicketData --file=${backup_dir}snapshot-MemberTicketData.gfd --member=${cfm_server_name}
import data --region=PosOrderOffline --file=${backup_dir}snapshot-PosOrderOffline.gfd --member=${cfm_server_name}
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
EOF

}

import-gemfire-data | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
