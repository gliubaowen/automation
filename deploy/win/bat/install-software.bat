@echo off

@REM Filename:    install-software.bat
@REM Version:     0.0.1
@REM Date:        2020-04-12
@REM Author:      LiuBaoWen
@REM Email:       bwliush@cn.ibm.com
@REM Description: 
@REM Notes: 	    待完成

REM 声明采用UTF-8编码
chcp 65001

setlocal

echo 安装常用软件开始

set eclipse="D:\backup\eclipse-inst-win64.exe"
%eclipse%

echo 安装常用软件完成

pause
