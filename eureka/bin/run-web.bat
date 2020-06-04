@echo off
rem /**
rem  * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
rem  *
rem  * Author: ThinkGem@163.com
rem  */
echo.
echo [信息] 打包Web工程，并运行Web工程。
echo.

%~d0
cd %~dp0

rem 打包Web工程（开始）
cd ..
call mvn clean package spring-boot:repackage -Dmaven.test.skip=true -U
cd target
rem 打包Web工程（结束）


rem 根据情况修改 web.jar 为您的 jar 包名称
mkdir web
copy web.war web
cd web
jar -xvf web.war
cd WEB-INF
call startup.bat

pause