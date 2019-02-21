#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    check-gemfire-regions.sh 
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 检查 gemfire region 信息
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

echo '[info] 检查gemfire region 开始.........'
${gfsh} <<EOF
${connect}
${list_regions}
EOF
echo "[info] 检查gemfire结果:>>>>>>>>> $?"
echo '[info] 检查gemfire region 结束.........'
