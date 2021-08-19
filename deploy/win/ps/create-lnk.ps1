<#
# Filename:    create-lnk.ps1 
# Version:     0.0.1
# Date:        2020-11-05
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 创建快捷方式
# Notes:    
#>

# 声明采用UTF-8编码
chcp 65001

Write-Host $(Get-Date) 创建桌面快捷方式开始，请勿关闭本窗口.

<#
可选参数
$shortcut.IconLocation = "shell32.dll,23"
$shortcut.WorkingDirectory = 
$shortcut.WindowStyle=1
$shortcut.Description=Desc
#>

Function CreateLnk($Program)
{	
    $start = $Program.LastIndexOf("\")+1
    $end = $Program.LastIndexOf(".")
    #第三步，定义快捷方式对象，并设置相关属性。
    $LnkName = $Program.Substring( $start,$end-$start )
	$WorkingDirectory = $Program.Substring( 0,$start-1 )
	
    $shortcut = $shell.CreateShortcut("$desktop\$LnkName.lnk")
	$shortcut.TargetPath = $Program
	$shortcut.WorkingDirectory = $WorkingDirectory
	#最后，保存设置。
	$shortcut.Save()
    return
}

Function CreateStartMenu($Program)
{
    $start=$Program.LastIndexOf("\")+1
    $end=$Program.LastIndexOf(".")
    #第三步，定义快捷方式对象，并设置相关属性。
    $LnkName=$Program.Substring( $start,$end-$start )
	$WorkingDirectory=$Program.Substring( 0,$start-1 )
	
    $shortcut = $shell.CreateShortcut("$StartMenuPrograms\$LnkName.lnk")
	$shortcut.TargetPath = $Program
	$shortcut.WorkingDirectory = $WorkingDirectory
	#最后，保存设置。
	$shortcut.Save()
    return
}

<#
#设置快捷方式名称（必选）
$eclipse_LnkName="eclipse jee"
$DiskGenius_LnkName="DiskGenius"
$plsqldev_LnkName="plsqldev"
$AS_SSD_Benchmark_LnkName="AS SSD Benchmark"
$DiskMark64_LnkName="DiskMark64"
$sqldeveloper_LnkName="sqldeveloper"
$DiskInfo64_LnkName="DiskInfo64"
$aida64_LnkName="aida64"
$XshellPortable_LnkName="XshellPortable"
$XftpPortable_LnkName="XftpPortable"
$VeraCrypt_x64_LnkName="VeraCrypt-x64"
$FeiQ_LnkName="FeiQ"
$MobaXterm_LnkName="MobaXterm"
#>

#设置程序或文件的完整路径（必选）
$eclipse_Program="D:\09.Workspace\eclipse\eclipse-jee-2021-06-R-win32-x86_64\eclipse.exe"
$DiskGenius_Program="D:\09.Workspace\tools\DG5301066_x64\DiskGenius\DiskGenius.exe"
$plsqldev_Program="D:\09.Workspace\PLSQL Developer 12\plsqldev.exe"
$AS_SSD_Benchmark_Program="D:\09.Workspace\tools\AS_SSD_Benchmark\AS SSD Benchmark.exe"
$DiskMark64_Program="D:\09.Workspace\tools\CrystalDiskMark6_0_1\DiskMark64.exe"
$sqldeveloper_Program="D:\09.Workspace\sqldeveloper\sqldeveloper.exe"
$DiskInfo64_Program="D:\09.Workspace\tools\CrystalDiskInfo_8.2.0\DiskInfo64.exe"
$aida64_Program="D:\09.Workspace\tools\aida64extreme_v4577\aida64.exe"
$XshellPortable_Program="D:\09.Workspace\tools\XshellXftpPortable\XshellPortable.exe"
$XftpPortable_Program="D:\09.Workspace\tools\XshellXftpPortable\XftpPortable.exe"
$VeraCrypt_x64_Program="D:\09.Workspace\tools\VeraCrypt\VeraCrypt-x64.exe"
$FeiQ_Program="D:\09.Workspace\tools\FeiQ.exe"
$MobaXterm_Program="D:\09.Workspace\tools\MobaXterm_Portable_v11.1\MobaXterm.exe"

#首先，我们要使用到COM组件，创建桌面快捷方式，最简单的办法是调用WScript.Shell这个COM组件。
$shell = New-Object -ComObject WScript.Shell
#第二步，因为我们是要在桌面创建快捷方式，那还必须得找到桌面的位置，即桌面的物理路径。
$desktop = [System.Environment]::GetFolderPath('Desktop')
$StartMenuPrograms = [System.Environment]::GetFolderPath('Programs')

CreateLnk $eclipse_Program
CreateLnk $DiskGenius_Program
CreateLnk $plsqldev_Program
CreateLnk $AS_SSD_Benchmark_Program
CreateLnk $DiskMark64_Program
CreateLnk $sqldeveloper_Program
CreateLnk $DiskInfo64_Program
CreateLnk $aida64_Program
CreateLnk $XshellPortable_Program
CreateLnk $XftpPortable_Program
CreateLnk $VeraCrypt_x64_Program
CreateLnk $FeiQ_Program
CreateLnk $MobaXterm_Program

#复制快捷方式到 C:\ProgramData\Microsoft\Windows\Start Menu\Programs 可以添加到开始菜单
CreateStartMenu $eclipse_Program
CreateStartMenu $DiskGenius_Program
CreateStartMenu $plsqldev_Program
CreateStartMenu $AS_SSD_Benchmark_Program
CreateStartMenu $DiskMark64_Program
CreateStartMenu $sqldeveloper_Program
CreateStartMenu $DiskInfo64_Program
CreateStartMenu $aida64_Program
CreateStartMenu $XshellPortable_Program
CreateStartMenu $XftpPortable_Program
CreateStartMenu $VeraCrypt_x64_Program
CreateStartMenu $FeiQ_Program
CreateStartMenu $MobaXterm_Program 

Write-Host $(Get-Date) 创建桌面快捷方式完成.

pause
