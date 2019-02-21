#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    check-gemfire-PosOrderOffline-data.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

echo '[info] 检查gemfire服务开始.........'
${gfsh} <<EOF
${connect}
query --query='select * from /PosOrderOffline t where t.mqSatatus != 5'
q
EOF
echo "[info] 检查gemfire结果:>>>>>>>>> $?"
echo '[info] 检查gemfire服务结束.........'
