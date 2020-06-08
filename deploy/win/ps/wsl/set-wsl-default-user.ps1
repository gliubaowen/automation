<#
.SYNOPSIS
# Filename:    set-wsl-default-user.ps1 
# Version:     0.0.1
# Date:        2019-10-16
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 设置WSL默认登陆用户
# Notes:    
#>

param (
	$user = 'root'
)

# 声明采用UTF-8编码
chcp 65001

Write-Host $(Get-Date) "设置WSL默认登陆用户开始"


# 4.设置默认登陆用户
ubuntu2004 config --default-user $user

Write-Host $(Get-Date) "设置WSL默认登陆用户完成"

pause
