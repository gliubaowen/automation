#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    check-gemfire-members.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 检查 gemfire member 信息
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

echo '[info] 检查gemfire member 开始.........'
${gfsh} <<EOF
${connect}
${list_members}
EOF
echo "[info] 检查gemfire结果:>>>>>>>>> $?"
echo '[info] 检查gemfire member 结束.........'
