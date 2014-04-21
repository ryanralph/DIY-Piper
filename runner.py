import RPi.GPIO as GPIO
import os
import time

printButton = 25
remember = 7
dataLED = 8
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(remember, GPIO.IN)
GPIO.setup(printButton, GPIO.IN)
GPIO.setup(dataLED, GPIO.OUT)
toggle = 1
for x in range(0,5):
	GPIO.output(dataLED, toggle)
	if toggle == 1:
		toggle = 0
	else:
		toggle = 1
while 1:
	if (GPIO.input(printButton) == False):
		GPIO.output(dataLED, True)
		if GPIO.input(remember) == False:
			#print("Forget")
			os.system("sudo ./home/pi/DIY-Piper/printkeys.py -f 1")
		else:
			#print("Remember")
			os.system("sudo ./home/pi/DIY-Piper/printkeys.py -r 1")
	else:
		#print("switch not pressed")
		GPIO.output(dataLED, False)
