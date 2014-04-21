import RPi.GPIO as GPIO
import os
import time

printButton = 25
remember = 7
dataLED = 8

GPIO.setmode(GPIO.BCM)
GPIO.setup(remember, GPIO.IN)
GPIO.setup(printButton, GPIO.IN)
GPIO.setup(dataLED, GPIO.OUT)

while 1:
	if (GPIO.input(printButton) == False):
		GPIO.output(dataLED, True)
		if GPIO.input(remember) == False:
			print("Forget")
			os.system("sudo ./printkeys.py -f 1")
		else:
			print("Remember")
			os.system("sudo ./printkeys.py -r 1")
	else:
#		print("switch not pressed")
		GPIO.output(dataLED, False)
