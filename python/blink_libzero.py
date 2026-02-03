

import gpiozero  as GPIO
from time import sleep

led = GPIO.OutputDevice(pin=18,initial_value=False )

while True:
    led.on()
    sleep(1)
    led.off()
    sleep(1)

