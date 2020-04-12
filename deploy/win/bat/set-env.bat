@echo off

@REM Filename:    set-env.bat
@REM Version:     0.0.1
@REM Date:        2020-04-12
@REM Author:      LiuBaoWen
@REM Email:       bwliush@cn.ibm.com
@REM Description: 
@REM Notes: 	    待完成

REM 声明采用UTF-8编码
chcp 65001

setlocal

echo 设置系统环境变量开始

set BAT_HOME="D:\01.Resources\06.Project\liqun\project\deploy\windows\bat"
set PS1_HOME="D:\01.Resources\06.Project\liqun\project\deploy\windows\ps1"

set JAVA_HOME="D:\Workspace\jdk\jdk1.8.0_181"
set classpath=".;"
set GIT_HOME="D:\Workspace\PortableGit"
set MAVEM_HOME="D:\Workspace\apache-maven-3.5.4"
set GRADLE_HOME="D:\Workspace\gradle-4.8.1-all\gradle-4.8.1"
set TOMCAT_HOME="D:\Workspace\apache-tomcat-7.0.92"
set CATALINA_HOME="D:\Workspace\apache-tomcat-7.0.92"
set H2_HOME="D:\Workspace\h2"
set NLS_LANG="SIMPLIFIED CHINESE_CHINA.AL32UTF8"

setx BAT_HOME %BAT_HOME% -m
setx JAVA_HOME %JAVA_HOME% -m
setx classpath %classpath% -m
setx GIT_HOME %GIT_HOME% -m
setx MAVEM_HOME %MAVEM_HOME% -m
setx MAVEM_HOME %MAVEM_HOME% -m
setx TOMCAT_HOME %TOMCAT_HOME% -m
setx CATALINA_HOME %CATALINA_HOME% -m
setx H2_HOME %H2_HOME% -m
setx NLS_LANG %NLS_LANG% -m

setx path "%path%;%%JAVA_HOME%%\bin;%%GIT_HOME%%\bin;%%MAVEM_HOME%%\bin;%%GRADLE_HOME%%\bin;%%TOMCAT_HOME%%\bin;%%H2_HOME%%\bin;C:\Program Files\TortoiseSVN\bin;%%BAT_HOME%%;%%PS1_HOME%%" -m

echo 设置系统环境变量成功

pause
