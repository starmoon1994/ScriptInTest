#!usr/bin/python
import os
import time

a = 3000
b = 1

TTT = not(a==b)

while TTT:
	print (b)
	print ("---------循环唤醒测试中------------------------")
	print ("---------关闭屏幕，等待进入睡眠----------------")
	os.system('adb -s 402362ce7d72 shell input keyevent 26')
	os.system('adb -s 404f4cce7d72 shell input keyevent 26')		
	time.sleep(20)
	print ("---------进入睡眠了，准备模拟点击power唤醒手机--")
	print ("---------你有10秒查看手机异常-------------------")
	os.system('adb -s 402362ce7d72 shell input keyevent 26')
	os.system('adb -s 404f4cce7d72 shell input keyevent 26')
	time.sleep(10)
	b = b+1
	TTT = not(a==b)
