#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    remove-gemfire-data.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 删除 gemfire region (MemberStatusComposite & MemberMgtLevel & OrgStores) 的全部数据
# Notes:       谨慎执行
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/gfsh-constants

remove-gemfire-data(){
${gfsh} << EOF
${connect}
${list_members}
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
${remove_region_MemberStatusComposite}
${remove_region_MemberMgtLevel}
${remove_region_OrgStores}
${remove_region_ProductsNRate}
${remove_region_MemberTicketData}
${remove_region_PosOrderOffline}
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
EOF
}

remove-gemfire-data | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
