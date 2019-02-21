#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    monitor-gemfire-server-local.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 监听 gemfire server 本地服务
# Notes:       
# -------------------------------------------------------------------------------

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

monitor-gemfire-server()
{
	echo "=============================monitor gemfire server start"  
	proc_num ServerLauncher
	number=$?
	if [ $number -eq 0 ]                                    # 判断进程是否存在
	then
${gfsh} <<EOF
conn;
start server --name=${cfm_server_name} --server-port=40405   --J=-XX:CMSInitiatingOccupancyFraction=80  --eviction-heap-percentage=75  --critical-heap-percentage=90  --disable-exit-when-out-of-memory=true    --max-threads=20000 --max-connections=10000  --initial-heap=1024m --max-heap=3072m   --dir=/opt/app/gemfire/ --mcast-port=0 --locators='${host_master}[10334],${host_slave}[10334]';
connect;
list members;
exit;
EOF
        echo "启动${cfm_server_name} 结果:>>>>>>>>> $?" >> $host_dir$file_name
       	echo "启动${cfm_server_name} 服务结束........." >> $host_dir$file_name
        proc_id  ServerLauncher                                        # 获取新进程号
        echo ${pid}, `date` >> $host_dir$file_name      # 将新进程号和重启时间记录
	fi
	echo "=============================monitor gemfire server end"
}

monitor-gemfire-server | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log


