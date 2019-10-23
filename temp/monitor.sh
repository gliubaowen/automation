#! /bin/sh

host_dir="/root/"                                      # 当前用户根目录
file_name="monitor.log"                         # 日志文件
cfm_locator_name="cfm-locator-slave"
cfm_server_name="cfm-server-slave"
geodeConfig="/opt/app/geode.properties"
pid=0
host_master=V-CRMO01
host_slave=V-CRMO02


cfm_prop(){
  arg1=$1
  echo `sed -n "/$arg1=/"p ${geodeConfig} | sed "s/${arg1}=//"`
}

cfm_locator_name="`cfm_prop gemfire-locator-name`"
echo $cfm_locator_name
cfm_server_name="`cfm_prop gemfire-server-name`"
echo $cfm_server_name
host_master="`cfm_prop host_master`"
echo $host_master
host_slave="`cfm_prop host_slave`"
echo $host_slave

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


echo "=============================cfm locator start"
proc_num LocatorLauncher
number=$?
if [ $number -eq 0 ]                                    # 判断进程是否存在
then 
	/usr/local/apache-geode-1.2.0/bin/gfsh <<EOF
	start locator --name=${cfm_locator_name} --port=10334 --dir=/opt/app/gemfire/ --mcast-port=0 --locators='${host_master}[10334],${host_slave}[10334]';
	list members;
	exit;
EOF
	echo "启动${cfm-locator-name} 结果:>>>>>>>>> $?" >> $host_dir$file_name
   	echo "启动${cfm-locator-name} 服务结束........." >> $host_dir$file_name
	proc_id  LocatorLauncher                                        # 获取新进程号
	echo ${pid}, `date` >> $host_dir$file_name      # 将新进程号和重启时间记录
fi

echo "=============================cfm locator end"  



echo "=============================cfm server start"  
proc_num ServerLauncher
number=$?
if [ $number -eq 0 ]                                    # 判断进程是否存在
then 
	/usr/local/apache-geode-1.2.0/bin/gfsh <<EOF
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
echo "=============================cfm server end"
