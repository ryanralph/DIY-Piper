import RPi.GPIO as GPIO
import time
import os

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
dataLED = 8
GPIO.setup(dataLED, GPIO.OUT)
GPIO.setup(31, GPIO.IN, pull_up_down = GPIO.PUD_UP)

def Int_shutdown(channel):
	GPIO.output(8, True)
	os.system("sudo shutdown -h now")


GPIO.add_event_detect(31, GPIO.FALLING, callback = Int_shutdown, bouncetime = 2000)

while 1:
	time.sleep(1)
