@echo off

@REM Filename:    lock-bde.bat
@REM Version:     0.0.1
@REM Date:        2020-04-12
@REM Author:      LiuBaoWen
@REM Email:       bwliush@cn.ibm.com
@REM Description: 
@REM Notes: 	    待完成

REM 声明采用UTF-8编码
chcp 65001

setlocal

echo 关闭BitLocker分区开始 

manage-bde -lock %1:

echo 关闭BitLocker分区完成

pause
