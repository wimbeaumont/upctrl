import sys
import time
#import pigpio

from upctrl_pinfunctions import *


def main():
    print("start program", sys.argv[0])

    pi,err = init_cce_1()
    if err:
        print("initialization of hardware failed with err", err)
        return err

    set_muxout('A')  # set the routing of the signals on the FPGA board
    pi.set_mode(D6, pigpio.OUTPUT)  # GPIO8 is equivalent to D6

    try:
        while True:
            pi.write(D6, 1)  # On
            print( "Ledd on")
            time.sleep(1)  # seconds
            pi.write(D6, 0)  # Off
            print( "Ledd off")
            time.sleep(1)
    except KeyboardInterrupt:
        pass
    finally:
        pi.stop()

if __name__ == "__main__":
    main()
