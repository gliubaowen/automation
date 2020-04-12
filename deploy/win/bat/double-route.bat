@echo off

@REM Filename:    double-route.bat
@REM Version:     0.0.1
@REM Date:        2020-04-12
@REM Author:      LiuBaoWen
@REM Email:       bwliush@cn.ibm.com
@REM Description: 
@REM Notes: 	    待完成

REM 声明采用UTF-8编码
chcp 65001

setlocal

echo 修改路由表开始

pause

route print

route delete 0.0.0.0

REM 添加内外网路由
route add 0.0.0.0 mask 0.0.0.0 10.10.255.254 -p 
route add 10.0.0.0 mask 255.0.0.0 128.192.218.254 -p 

route print

echo 修改路由表完成

pause
