
@echo off
echo - set env
set ADB_CMD=%cd%\tools\adb.exe
echo  - checking connection...
%ADB_CMD% kill-server
%ADB_CMD% devices

echo  - device connected.
echo  - "setting ADB please wait "

%ADB_CMD% root
%ADB_CMD% kill-server

%ADB_CMD% remount
%ADB_CMD% shell "setprop persist.camera.hal.debug    5"
%ADB_CMD% shell "setprop persist.camera.sensor.debug    3"
echo  - "ADB is setted successfully!!!"

@pause