#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    geode-benchmark.sh
# Version:     1.0
# Date:        2018-09-27
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: geode-benchmark 压力测试 
# Notes:       此脚本未完成
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/public_function.sh

nowtime=$(date +%Y-%m-%d-%H-%M-%S)
gfshPath="/usr/local/apache-geode-1.6.0/bin/gfsh"

        echo 'geode-benchmark 测试开始.........'
        
for ((j=0 ; j<5000 ; j++));do
        echo -e "$gfshPath -e \"connect --locator=192.168.5.75[30001]\" \c" > datatmp+${j}.sh
        for ((i=0; i<=10000; i++));do
           echo -e " -e \"put --region=region1 --key=${j}.${i} --value=${nowtime}+data${i}+-+${j}\"\c" >> datatmp+${j}.sh
        done
        echo thread:${j}
        nohup sh datatmp+${j}.sh > /dev/null  2>&1 &
done
        
        echo 'geode-benchmark 测试结束.........'