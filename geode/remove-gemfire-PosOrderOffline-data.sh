#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    remove-gemfire-PosOrderOffline-data.sh
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
${query_PosOrderOffline_count}
${remove_region_PosOrderOffline}
${query_PosOrderOffline_count}
EOF
}

remove-gemfire-data | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
