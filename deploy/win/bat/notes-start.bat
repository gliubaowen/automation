@echo off

@REM Filename:    notes-start.bat
@REM Version:     0.0.1
@REM Date:        2020-04-12
@REM Author:      LiuBaoWen
@REM Email:       bwliush@cn.ibm.com
@REM Description: 
@REM Notes: 	    待完成

REM 声明采用UTF-8编码
chcp 65001

setlocal

echo 启动oneNote开始

set exe="C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
start "" %exe%

echo 启动oneNote完成

pause
