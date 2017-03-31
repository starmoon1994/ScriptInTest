
@echo off
echo - set env
set ADB_CMD=%cd%\tools\adb.exe
echo  - checking connection...
%ADB_CMD% kill-server
%ADB_CMD% devices

echo  - device connected.
echo  - "setting ADB please wait "
rem 进行adb设置
%ADB_CMD% root
%ADB_CMD% kill-server

%ADB_CMD% remount
%ADB_CMD% shell "setprop persist.camera.hal.debug    5"
%ADB_CMD% shell "setprop persist.camera.sensor.debug    3" && echo  - "ADB is setted successfully!!!" || echo -failed


rem 开启离线log
%ADB_CMD% shell "cd sdcard/ && mkdir camera_log" && echo  - mkdir successfully!!!

%ADB_CMD% shell "logcat -v threadtime -r 400000 -n 5 -f /sdcard/camera_log/main_logcat.log & logcat -b events -v threadtime -f /sdcard/camera_log/event_logcat.log & logcat -b radio -v threadtime -f /sdcard/camera_log/radio_logcat.log & logcat -b system -v threadtime -f /sdcard/camera_log/system_logcat.log & cat /proc/kmsg > /sdcard/camera_log/kmsg.log & " && echo  - logcat has been opened successfully!!



@pause