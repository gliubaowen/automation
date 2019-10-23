#!/bin/bash

###############################################
# Filename:    monitor-gemfire-locator-local.sh
# Version:     2.0
# Date:        2019-10-23
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: Plugin to monitor the gemfire locator local
# Notes:       
###############################################

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/public_function.sh

host_dir="/root/"                                      # 当前用户根目录
file_name="monitor.log"                         # 日志文件
pid=0

load_profile

proc_num()                                              # 计算进程数
{
	arg1=$1
	num=`ps -ef | grep $arg1 | grep -v grep | wc -l`
	return $num
}

proc_id()                                               # 进程号
{
	arg1=$1
	pid=`ps -ef | grep $arg1 | grep -v grep | awk '{print $2}'`
}

monitor-gemfire-locator()
{
	echo "[info] =============================monitor gemfire locator start"
	proc_num LocatorLauncher
	number=$?
	if [ $number -eq 0 ]                                    # 判断进程是否存在
	then
${gfsh} <<EOF
start locator --name=${cfm_locator_name} --port=10334 --dir=/opt/app/gemfire/ --mcast-port=0 --locators='${host_master}[10334],${host_slave}[10334]';
list members;
exit;
EOF
		echo "[info] 启动${cfm-locator-name} 结果:>>>>>>>>> $?" >> $host_dir$file_name
		echo "[info] 启动${cfm-locator-name} 服务结束........." >> $host_dir$file_name
		proc_id  LocatorLauncher                                        # 获取新进程号
		echo ${pid}, `date` >> $host_dir$file_name      # 将新进程号和重启时间记录
	fi
	
	echo "[info] =============================monitor gemfire locator end"  
}

monitor-gemfire-locator | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
