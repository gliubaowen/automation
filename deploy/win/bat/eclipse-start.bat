@echo off

@REM Filename:    eclipse-start.bat
@REM Version:     0.0.1
@REM Date:        2020-04-12
@REM Author:      LiuBaoWen
@REM Email:       bwliush@cn.ibm.com
@REM Description: 
@REM Notes: 	    待完成

REM 声明采用UTF-8编码
chcp 65001

setlocal

echo 启动eclipse开始

set exe="C:\Users\wliub\eclipse\jee-photon\eclipse\eclipse.exe"
start "" %exe%

echo 启动eclipse完成

pause
