<#
# Filename:    double-route.ps1 
# Version:     0.0.1
# Date:        2021-01-26
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 设置双网卡路由表 适用于多网卡多链路网络环境
# Notes:    
#>

# 声明采用UTF-8编码
chcp 65001

Write-Host $(Get-Date) 修改路由表开始

pause

route print

pause

# 删除默认路由
Write-Host $(Get-Date) 删除默认路由
route delete 0.0.0.0

# 添加特定网络路由 内网
Write-Host $(Get-Date) 添加特定网络路由 内网
route add 10.0.0.0 mask 255.0.0.0 172.24.104.1 -p 

# 添加默认网络路由 外网
Write-Host $(Get-Date) 添加默认网络路由 外网
route add 0.0.0.0 mask 0.0.0.0 192.168.2.1 -p 

# 删除特定默认网络 一般不需要 
#route delete 0.0.0.0 128.192.218.254

route print

#测试外网链接
Write-Host $(Get-Date) 测试外网链接
ping 114.114.114.114

#测试DNS是否可用
Write-Host $(Get-Date) 
ping baidu.com

#测试内网链接
Write-Host $(Get-Date) 
ping 10.185.56.103

Write-Host $(Get-Date) 修改路由表完成

pause
