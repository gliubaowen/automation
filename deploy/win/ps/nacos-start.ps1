<#
# Filename:    nacos-start.ps1 
# Version:     0.0.1
# Date:        2021-07-08
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 启动nacos
# Notes:    
#>

# 声明采用UTF-8编码
chcp 65001

Write-Host $(Get-Date) 启动nacos开始，请勿关闭本窗口.

cd D:\09.Workspace\nacos-server-2.0.2\bin

./startup.cmd -m standalone

Write-Host $(Get-Date) 启动nacos完成.

pause
