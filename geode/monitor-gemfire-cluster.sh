#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    monitor-gemfire-cluster.sh
# Version:     2.0
# Date:        2018-11-20
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: Plugin to monitor the gemfire cluster
# Notes:       
# -------------------------------------------------------------------------------

workspaces=$(dirname "$0")

. ${workspaces}/common-constants

. ${workspaces}/public_function.sh

#运行目录
#cd ${workspaces}

#选择远程主机
select_host(){
	if [ $local_host == $host_master ]; then
		exec_host=$host_slave
	elif [ $local_host == $host_slave ]; then
		exec_host=$host_master
	else
		echo "[info] 配置文件：${appNameConfig} 错误"
	exit 1
	fi
	echo "[info] select remote host : $exec_host"
}

#检查远程主机 ssh 服务
check_remote_host(){
	remote_flag=`nc -w 1 $exec_host 22 < /dev/null | grep SSH | wc -l`
	echo "[info] remote_flag: $remote_flag"
	if [ $remote_flag == 1 ] ; then
		echo "[info] remote host: $exec_host ssh services start"
		return 0
	else
		echo "[info] remote host: $exec_host ssh services not start"
		return 1
	fi
}

check_gemfire_locator(){
	local_gemfire_locator=`${workspaces}/check-gemfire-members.sh | grep locator | wc -l` 
	remote_gemfire_locator=`${workspaces}/ssh-cmd.sh $exec_host ${workspaces}/check-gemfire-members.sh | grep locator | wc -l`
	echo "[info] local_gemfire_locator: $local_gemfire_locator"
	echo "[info] remote_gemfire_locator: $remote_gemfire_locator"
	if [[ $local_gemfire_locator == 2 && $remote_gemfire_locator == 2 ]] ; then
		echo "[info] gemfire server is true"
		return 0
	elif [[ $local_gemfire_locator == 2 && $remote_gemfire_locator != 2 ]] ; then
		echo "[info] gemfire local server is true;gemfire remote server is false"
		return 1            
	elif [[ $local_gemfire_locator != 2 && $remote_gemfire_locator == 2 ]] ; then
		echo "[info] gemfire local server is false;gemfire remote server is true"
		return 2
	fi 
}

check_gemfire_server(){
	local_gemfire_server=`${workspaces}/check-gemfire-members.sh | grep server | wc -l`
	remote_gemfire_server=`${workspaces}/ssh-cmd.sh $exec_host ${workspaces}/check-gemfire-members.sh | grep server | wc -l`
	echo "[info] local_gemfire_server: $local_gemfire_server"
	echo "[info] remote_gemfire_server: $remote_gemfire_server"
	if [[ $local_gemfire_server == 2 && $remote_gemfire_server == 2 ]] ; then
		echo "[info] gemfire server is true"
		return 0
	elif [[ $local_gemfire_server == 2 && $remote_gemfire_server != 2 ]] ; then
		echo "[info] gemfire local server is true;gemfire remote server is false"
		return 1            
	elif [[ $local_gemfire_server != 2 && $remote_gemfire_server == 2 ]] ; then
		echo "[info] gemfire local server is false;gemfire remote server is true"
		return 2
	fi 
}

check_gemfire_member(){
	member_count=4
	query_member=`${workspaces}/check-gemfire-members.sh | grep cfm | wc -l`
	remote_query_member=`${workspaces}/ssh-cmd.sh $exec_host ${workspaces}/check-gemfire-members.sh | grep cfm | wc -l`
	echo "[info] query_member: $query_member"
	echo "[info] remote_query_member: $remote_query_member"
	if [[ $query_member == $member_count && $remote_query_member == $member_count ]] ; then
		echo "[info] gemfire member is true"
		return 0
	elif [[ $query_member == $member_count && $remote_query_member != $member_count ]] ; then
		echo "[info] gemfire local member is true;gemfire remote member is false"
		return 1	
	elif [[ $query_member != $member_count && $remote_query_member == $member_count ]] ; then
		echo "[info] gemfire local member is false;gemfire remote member is true"
		return 2
	fi
}

check_gemfire_query(){
	result_count=6
	local_query_count=`${workspaces}/check-gemfire-data-count.sh | grep "Result     : true" | wc -l`
	remote_query_count=`${workspaces}/ssh-cmd.sh $exec_host ${workspaces}/check-gemfire-data-count.sh | grep "Result     : true" | wc -l`
	echo "[info] local_query_count: $local_query_count"
	echo "[info] remote_query_count: $remote_query_count"
	if [[ $local_query_count == $result_count && $remote_query_count == $result_count ]] ; then	
		echo "[info] gemfire query is true"
		return 0
	elif [[ $local_query_count == $result_count && $remote_query_count != $result_count ]] ; then
		echo "[info] gemfire local query is false"
		return 1
	elif [[ $local_query_count != $result_count && $remote_query_count == $result_count ]] ; then
		echo "[info] gemfire remote query is false"
		return 2
	else 
		echo "[info] gemfire query is false"
		return 3
	fi
}

check_app(){
	local_app_count=`jps | grep member-store-gateway | grep -v grep | wc -l`
	remote_app_count=`${workspaces}/ssh-cmd.sh $exec_host "jps" | grep member-store-gateway | wc -l`
	echo "[info] local_app_count: $local_app_count"
	echo "[info] remote_app_count: $remote_app_count"
	if [[ $local_app_count == 1 && $remote_app_count == 1 ]] ; then 
		echo "[info] cfm app start"
		return 0
	elif [[ $local_app_count == 1 && $remote_app_count != 1 ]] ; then
		echo "[info] cfm local app start;cfm remote app stop"
		return 1
	elif [[ $local_app_count != 1 && $remote_app_count == 1 ]] ; then
		echo "[info] cfm local app stop;cfm remote app start"
		return 2
	else 
		echo "[info] cfm app stop"	
		return 3
	fi
}

monitor-gemfire-cluster(){
	echo "[info] monitor gemfire locator remote 开始"
	success_flag=0
	load_profile
	
	${workspaces}/monitor-gemfire-locator-local.sh
	${workspaces}/monitor-gemfire-locator-remote.sh
		
	select_host
	
	declare check_remote_flag
	for ((i=0;i<10;i++ ))
	do
		check_remote_host
		if [[ $? = $success_flag ]] ; then
			check_remote_flag=0	
			echo "[info] check_remote_host is true, break for"
			break
		fi
		echo "[info] check_remote_host is false, wait 30 sec"
		sleep 30
	done

	if [ $check_remote_flag == 0 ] ; then
		echo "[info] remote host is start, 服务正常启动"
		${workspaces}/monitor-gemfire-locator-local.sh
		${workspaces}/monitor-gemfire-locator-remote.sh
		check_gemfire_locator
		check_result=$?
		echo "[info] check_result: $check_result"
		if [ $check_result = 0 ] ; then
			break
		else
#			${workspaces}/stop-gemfire-cluster.sh
			${workspaces}/start-gemfire-locator-local.sh
			${workspaces}/start-gemfire-locator-remote.sh
			${workspaces}/start-gemfire-server-local.sh &
			${workspaces}/start-gemfire-server-remote.sh	
		fi
            ${workspaces}/monitor-gemfire-server-local.sh &
			${workspaces}/monitor-gemfire-server-remote.sh		
	else
		echo "[info] remote host not start, 只启动本地服务"
		${workspaces}/monitor-gemfire-locator-local.sh
		${workspaces}/monitor-gemfire-server-local.sh
	fi 
	
:<<COMMENT	
多
行
注
释
COMMENT

}

monitor-gemfire-cluster | tee ${logdir}/$(basename "$0")-$(date +%Y-%m-%d-%H:%M:%S).log
