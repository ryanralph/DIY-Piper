import RPi.GPIO as GPIO
import os
import time

printButton = 25
remember = 7
dataLED = 8

GPIO.setmode(GPIO.BCM)
GPIO.setup(remember, GPIO.IN)
GPIO.setup(printButton, GPIO.IN)
GPIO.setup(dataLED, GPIO.OUTPUT)

while 1:
	if (GPIO.input(printButton) == True):
		if GPIO.input(remember) == False:
			print("Forget")
			os.system("sudo ./Piper/printkeys.py -f 1")
			time.sleep(10)
		else:
			print("Remember")
			os.system("sudo ./Piper/ printkeys.py -r 1")
			time.sleep(10)
		GPIO.output(dataLED, False)
	else:
#		print("switch not pressed")
		GPIO.output(dataLED, True)
