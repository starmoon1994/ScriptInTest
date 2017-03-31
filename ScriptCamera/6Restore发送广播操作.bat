@echo off
echo - set env
set ADB_CMD=%cd%\tools\adb.exe
echo  - checking connection...
%ADB_CMD% kill-server
%ADB_CMD% devices
echo  - device connected.
REM 以上是初始化ADB的地址

REM 正准备初始化手机
%ADB_CMD%  shell "am broadcast -a android.intent.action.MASTER_CLEAR"&& echo -  MASTER_CLEAR success!!! || echo - MASTER_CLEAR failed

@pause