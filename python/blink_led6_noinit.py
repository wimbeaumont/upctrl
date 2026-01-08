import sys
import time
import pigpio
from cce_1_def import *
def main():
    print("start program", sys.argv[0])


    pi = pigpio.pi()
    if not pi.connected:
       exit()
    #set mux 
    pi.set_mode(SEL0, pigpio.OUTPUT)
    pi.set_mode(SEL1, pigpio.OUTPUT)
    pi.set_mode(D6, pigpio.OUTPUT)  # GPIO9 is equivalent to D6
    pi.write(SEL0,0)
    pi.write(SEL1,0)

    try:
        while True:
            pi.write(D6, 1)  # On
            print( "Ledd on")
            time.sleep(2)  # seconds
            pi.write(D6, 0)  # Off
            print( "Ledd off")
            time.sleep(2)
    except KeyboardInterrupt:
        pass
    finally:
        pi.stop()

if __name__ == "__main__":
    main()
