#!/bin/bash

###############################################
# Filename:    create-gemfire-index.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 创建 gemfire 索引
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/gfsh-constants

create-gemfire-index(){
	echo '[info] 创建gemfire-RNate-index开始.........'
${gfsh} <<EOF
${connect}
${list_members}
${create_index_productNGoodsIndex}
${create_index_productNClassIndex}
${describe_region_ProductsNRate}
EOF
	jps;
	echo "[info] 创建gemfire-RNate-index结果:>>>>>>>>> $?"
	echo '[info] 创建gemfire-RNate-index结束.........'
}

create-gemfire-index | tee ${logdir}/create-gemfire-index-$(date +%Y-%m-%d-%H:%M:%S).log
