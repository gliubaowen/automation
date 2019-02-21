#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    check-gemfire-all.sh 
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 检查 gemfire 所有的部署信息和数据总量
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

echo '[info] 检查 gemfire 所有信息 开始.........'
${gfsh} <<EOF
${connect}
${list_members}
${list_deployed}
${list_regions}
${list_indexes}
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
EOF
echo "[info] 检查gemfire结果:>>>>>>>>> $?"
echo '[info] 检查 gemfire 所有信息 结束.........'
