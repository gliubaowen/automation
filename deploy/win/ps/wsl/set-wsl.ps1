<#
# Filename:    set-wsl.ps1 
# Version:     0.0.1
# Date:        2019-10-16
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 设置WSL
# Notes:    
#>

# 声明采用UTF-8编码
chcp 65001

Write-Host $(Get-Date)  "配置开启WSL开始"

Write-Host $(Get-Date)  "按任意键开始配置WSL开始"
cmd /c "pause>nul"

Write-Host $(Get-Date)  'Enable the "Windows Subsystem for Linux" optional feature.'
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Write-Host $(Get-Date)  'Before installing WSL 2, you must enable the "Virtual Machine Platform" optional feature.'
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Host $(Get-Date)  'Restart your machine to complete the WSL install'
Write-Host $(Get-Date)  "按任意键重启计算机"
cmd /c "pause>nul"
Restart-Computer

# Set WSL 2 as your default version
wsl --set-default-version 2

wsl --set-version Ubuntu-20.04 2

Write-Host $(Get-Date) "配置VirtualMachinePlatform开始"

Write-Host $(Get-Date) "配置VirtualMachinePlatform完成"


# 1.设置默认运行的linux系统
# wslconfig /setdefault <DistributionName>

# 2.卸载linux系统

# wslconfig /unregister <DistributionName>

# 3.查看已安装的linux系统
# wslconfig /list

# 4.设置默认登陆用户
# ubuntu config --default-user root

Write-Host $(Get-Date) "配置WSL完成"

# 重启电脑
Restart-Computer

pause
