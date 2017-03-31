@echo off
echo - set env
set ADB_CMD=%cd%\tools\adb.exe
echo  - checking connection...

%ADB_CMD% devices
echo  - device connected.
rem win7 date behaves differently..
rem echo get pc system version
ver | find "5.1" > NUL && set XT=windowsXP
ver | find "6.1" > NUL && set XT=windows7


%ADB_CMD% root
%ADB_CMD% remount
rem %ADB_CMD% shell "mkdir camera_log"
%ADB_CMD% shell "cd sdcard/ && mkdir camera_log"
echo  - mkdir successfully!!!



%ADB_CMD% shell "logcat -v threadtime -r 400000 -n 5 -f /sdcard/camera_log/main_logcat.log & logcat -b events -v threadtime -f /sdcard/camera_log/event_logcat.log & logcat -b radio -v threadtime -f /sdcard/camera_log/radio_logcat.log & logcat -b system -v threadtime -f /sdcard/camera_log/system_logcat.log & cat /proc/kmsg > /sdcard/camera_log/kmsg.log & "

echo  - logcat has been opened successfully!!

@pause