<#
# Filename:    set-env.ps1 
# Version:     0.0.1
# Date:        2020-11-05
# Author:      LiuBaoWen
# Email:       bwliush@cn.ibm.com
# Description: 设置系统全局环境变量
# Notes:    
#>

# 声明采用UTF-8编码
# 在华为云系统 win7下会导致powershell停止运行
chcp 65001

Write-Host $(Get-Date) 设置系统环境变量开始

$PS_HOME = "D:\06.Project\00.myproject\automation\deploy\win\ps"
$BAT_HOME = "D:\06.Project\00.myproject\automation\deploy\win\bat"
$SH_HOME = "D:\06.Project\00.myproject\automation\deploy\linux"

$JAVA_HOME = "D:\09.Workspace\jdk\jdk1.8.0_181"
$IBM_JAVA_PATH = "C:\ProgramData\Oracle\Java\javapath"
$classpath = ".;"
$GIT_HOME = "D:\09.Workspace\PortableGit"
$MAVEM_HOME = "D:\09.Workspace\apache-maven-3.5.4"
$MAVEN_OPTS = "-Duser.language=zh-CN -Dfile.encoding=UTF-8"
$GRADLE_HOME = "D:\09.Workspace\gradle-4.8.1-all\gradle-4.8.1"
$GRADLE_USER_HOME = "D:\09.Workspace\.gradle"
$GRADLE_OPTS = "-Dfile.encoding=utf-8"
$TOMCAT_HOME = "D:\09.Workspace\apache-tomcat-7.0.92"
$CATALINA_HOME = "D:\09.Workspace\apache-tomcat-7.0.92"
$H2_HOME = "D:\09.Workspace\h2"
$NLS_LANG = "SIMPLIFIED CHINESE_CHINA.AL32UTF8"
$JMETER_HOME = "D:\09.Workspace\apache-jmeter-5.2"
$MINGW_HOME = "D:\09.Workspace\mingw64\x86_64-8.1.0-release-posix-seh-rt_v6-rev0"
$ADB_HOME = "D:\09.Workspace\tools\platform-tools"
$JBOSS_HOME = "D:\09.Workspace\wildfly-20.0.1.Final"

# %USERPROFILE%\AppData\Local\Microsoft\WindowsApps
# 系统默认path变量值
$env_path = "%SystemRoot%\system32;" `
+ "%SystemRoot%;" `
+ "%SystemRoot%\System32\Wbem;" `
+ "%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;" `
+ "%SYSTEMROOT%\System32\OpenSSH\;" `
+ "C:\Program Files (x86)\VMware\VMware Workstation\bin\;" ;

# 扩展path变量值
$env_path_ext = $env_path `
+ "%JAVA_HOME%\bin;" `
+ "%GIT_HOME%\bin;" `
+ "%MAVEM_HOME%\bin;" `
+ "%GRADLE_HOME%\bin;" `
+ "%TOMCAT_HOME%\bin;" `
+ "%H2_HOME%\bin;" `
+ "%PS_HOME%;" `
+ "%SH_HOME%;" `
+ "%JMETER_HOME%\bin;" `
+ "%MINGW_HOME%\bin;" `
+ "%JBOSS_HOME%\bin;" `
+ "%ADB_HOME%;" ;

[environment]::SetEnvironmentvariable("BAT_HOME", $BAT_HOME, "machine")
[environment]::SetEnvironmentvariable("PS_HOME", $PS_HOME, "machine")
[environment]::SetEnvironmentvariable("BASH_HOME", $BASH_HOME, "machine")

[environment]::SetEnvironmentvariable("JAVA_HOME", $JAVA_HOME, "machine")
[environment]::SetEnvironmentvariable("classpath", $classpath, "machine")
[environment]::SetEnvironmentvariable("GIT_HOME", $GIT_HOME, "machine")
[environment]::SetEnvironmentvariable("MAVEM_HOME", $MAVEM_HOME, "machine")
[environment]::SetEnvironmentvariable("MAVEN_OPTS", $MAVEN_OPTS, "machine")
[environment]::SetEnvironmentvariable("GRADLE_HOME", $GRADLE_HOME, "machine")
[environment]::SetEnvironmentvariable("GRADLE_USER_HOME", $GRADLE_USER_HOME, "machine")
[environment]::SetEnvironmentvariable("GRADLE_OPTS", $GRADLE_OPTS, "machine")
[environment]::SetEnvironmentvariable("TOMCAT_HOME", $TOMCAT_HOME, "machine")
[environment]::SetEnvironmentvariable("CATALINA_HOME", $CATALINA_HOME, "machine")
[environment]::SetEnvironmentvariable("H2_HOME", $H2_HOME, "machine")
[environment]::SetEnvironmentvariable("NLS_LANG", $NLS_LANG, "machine")
[environment]::SetEnvironmentvariable("JMETER_HOME", $JMETER_HOME, "machine")
[environment]::SetEnvironmentvariable("MINGW_HOME", $MINGW_HOME, "machine")
[environment]::SetEnvironmentvariable("JBOSS_HOME", $JBOSS_HOME, "machine")
[environment]::SetEnvironmentvariable("ADB_HOME", $ADB_HOME, "machine")

[environment]::SetEnvironmentvariable("path", $env_path_ext, "machine")

Write-Host $(Get-Date) 设置系统环境变量成功

pause
