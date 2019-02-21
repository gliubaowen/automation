#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    mv-gemfire-data-file.sh 
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 移动 gemfire 数据&配置文件到备份目录下
# Notes:       谨慎执行，执行之前需要保证gemfire服务关闭
# -------------------------------------------------------------------------------

date=$(date +%Y-%m-%d-%H:%M:%S)
source_dir=/opt/app/gemfire/
backup_dir=/opt/app/gemfirebak/data/config/$date

mv-gemfire-data-file(){
	
	echo '[info] 移动gemfire数据开始.........'
	mkdir -p $backup_dir
	mv $source_dir* $backup_dir/
	echo '[info] 移动gemfire数据完成.........'
        
	echo "[info] 源目录:$source_dir:下文件"
	ls $source_dir
        
    echo "[info] 目的目录:$backup_dir:下文件"
	ls $backup_dir

}

mv-gemfire-data-file | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
