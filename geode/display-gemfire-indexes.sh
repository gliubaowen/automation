#!/bin/bash

###############################################
# Filename:    display-gemfire-indexes.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 检查gemfire 索引 信息
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

echo '[info] 检查 gemfire index 开始.........'
${gfsh} <<EOF
${connect}
${list_indexes}
EOF
echo "[info] 检查gemfire结果:>>>>>>>>> $?"
echo '[info] 检查 gemfire index 结束.........'
