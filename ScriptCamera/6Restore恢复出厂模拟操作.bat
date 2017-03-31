@echo off
echo - set env
set ADB_CMD=%cd%\tools\adb.exe
echo  - checking connection...
%ADB_CMD% kill-server
%ADB_CMD% devices
echo  - device connected.
REM 从相机界面点击home，回到锁屏界面然后划开锁屏
%ADB_CMD% shell "input keyevent 3"
%ADB_CMD% shell "input swipe 577 1170 557 250"
echo -home 
rem 点击home
%ADB_CMD% shell "input keyevent 3"
rem 点击设置
%ADB_CMD% shell "input tap 100 940"
rem 划出关于手机
%ADB_CMD% shell "input swipe 577 1170 557 250"


rem 滑动出更多设置的操作
%ADB_CMD% shell "input swipe 600 600 600 820"
rem 点击更多设置
%ADB_CMD% shell "input tap 634 260"
rem 进入更多设置后划出开发者选项
%ADB_CMD% shell "input swipe 577 1170 557 250"
REM 点击备份和重置
%ADB_CMD% shell "input tap 500 1100"
rem 点击恢复出厂设置
%ADB_CMD% shell "input tap 500 600"
REM 再点击恢复出厂设置里下面的恢复出厂设置按钮
%ADB_CMD% shell "input tap 350 1150"
echo -opreations over!!! 
@pause