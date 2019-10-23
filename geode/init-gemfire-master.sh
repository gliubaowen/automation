#!/bin/bash

###############################################
# Filename:    init-gemfire-master.sh 
# Version:     1.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 初始化gemfire master服务
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/query-constants

. ${workspaces}/gfsh-constants

. ${workspaces}/public_function.sh

date=$(date +%Y-%m-%d-%H:%M:%S)
source_dir=/opt/app/gemfire/
backup_dir=/opt/app/gemfirebak/data/$date

        echo '备份gemfire-master数据开始.........'
mkdir -p $backup_dir
mv $source_dir* $backup_dir/
        echo '备份gemfire-master数据完成.........'
        
        echo '部署gemfire-master服务开始.........'
${gfsh} <<EOF
start locator --name=cfm-locator-master --port=10334 --dir=/opt/app/gemfire/ --mcast-port=0 --locators='V-CFM001[10334],V-CFM002[10334]';
start server --name=cfm-server-master --server-port=40405 --J=-XX:CMSInitiatingOccupancyFraction=80  --eviction-heap-percentage=75  --critical-heap-percentage=90   --max-threads=20000 --max-connections=10000 --disable-exit-when-out-of-memory=true  --initial-heap=1024m --max-heap=3072m  --dir=/opt/app/gemfire/ --mcast-port=0 --locators='V-CFM001[10334],V-CFM002[10334]';
$list_members
$deploy_jar
y
$list_deployed
$create_region_MemberCardStatus
$create_region_MemberMemStatus
$create_region_ProductsNRate
$create_region_MemberStatusComposite
$create_region_MemberMgtLevel
$create_region_CheckDistributed
$create_region_OrgStores
$create_region_CampResultGoods
$create_region_CampResultHead
$create_region_CampResultLadder
$create_region_CampResultMemGroup
$create_region_CampResultMemLabel
$create_region_CampResultShop
$create_region_PosOrderOffline
$create_region_MemberTicketData
$list_regions
EOF
	jps;
	echo "部署gemfire-master结果:>>>>>>>>> $?"
        echo '部署gemfire-master服务结束.........'
