import time
import pigpio

# use GPIO18 to control the green LED on the adapter board.
LEDgreen = 18

# you have to initialize the library and configure the processor IO
pi = pigpio.pi()
if not pi.connected:
    exit()

print("Control Green LED")
pi.set_mode(LEDgreen, pigpio.OUTPUT)  # Set GPIO18 as output.

try:
    while True:
        print( "Ledd on")
        pi.write(LEDgreen, 1)  # On
        time.sleep(1)  # you need some time to see it
        # remove both sleep statements to see what happens
        print( "Ledd off")
        pi.write(LEDgreen, 0)  # Off
        time.sleep(1)
except KeyboardInterrupt:
    pass

pi.stop()
