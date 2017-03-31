@echo off
echo - set env
set ADB_CMD=%cd%\tools\adb.exe
echo  - checking connection...

%ADB_CMD% devices
echo  - device connected.
echo  - now catching log. Please wait.
%ADB_CMD% pull /sdcard/camera_log/ ./1
%ADB_CMD% pull /data/tombstones ./1
%ADB_CMD% pull /data/anr ./1
echo  - That is all log you need.

@pause