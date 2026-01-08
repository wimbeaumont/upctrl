import lgpio  
from time import sleep

RPI.GPIO.setmode(BCM)

LED=18 # gpio18 

GPIO.setup( LED , OUT, Initial=0)



while True:
    GPIO.output(LED,0)
    sleep(1)
    GPIO.output(LED,1)
    sleep(1)

