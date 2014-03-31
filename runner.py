import RPi.GPIO as GPIO
import os
import time

printButton = 24
remember = 25
printing = False
GPIO.setmode(GPIO.BCM)
GPIO.setup(remember, GPIO.IN)
GPIO.setup(printButton, GPIO.IN)

while 1:
	if (GPIO.input(printButton) == True):
		if GPIO.input(remember) == False:
#			print("Forget")
			os.system("sudo python printkeys.py -f 1")
			time.sleep(10)
		else:
#			print("Remember")
			os.system("sudo python printkeys.py -r 1")
			time.sleep(10)
#	else:
#		print("switch not pressed")
