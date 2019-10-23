#!/bin/bash

###############################################
# Filename:    display-gemfire-data-count.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 检查gemfire region数据总量
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

echo '[info] 检查gemfire服务开始.........'
${gfsh} <<EOF
${connect}
${query_MemberStatusComposite_count}
${query_MemberMgtLevel_count}
${query_OrgStores_count}
${query_ProductsNRate_count}
${query_MemberTicketData_count}
${query_PosOrderOffline_count}
EOF
echo "[info] 检查gemfire结果:>>>>>>>>> $?"
echo '[info] 检查gemfire服务结束.........'
