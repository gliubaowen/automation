@echo off

@REM Filename:    pdm-start.bat
@REM Version:     0.0.1
@REM Date:        2020-04-12
@REM Author:      LiuBaoWen
@REM Email:       bwliush@cn.ibm.com
@REM Description: 
@REM Notes: 	    待完成

REM 声明采用UTF-8编码
chcp 65001

setlocal

echo 打开product.pdm文件开始

set file="D:\01.Resources\06.Project\liqun\doc\liqun-doc\04 系统设计\31 数据库设计\10 中台\商品\product.pdm"
set exe="C:\Program Files (x86)\Sybase\PowerDesigner 16\PdShell16.exe"
start %exe% %file%

echo 打开product.pdm文件完成

pause
