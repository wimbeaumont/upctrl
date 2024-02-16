import sys
import time
import pigpio
from pr_utils import init_cce_1
from cce_1_def import set_muxout

"""
gcc -o blink_led6 blink_led6.c -lpigpio -lpthread
"""

def main():
    print("start program", sys.argv[0])

    err = init_cce_1()
    if err:
        print("initialization of hardware failed with err", err)
        return err

    set_muxout('A')  # set the routing of the signals on the FPGA board
    pi = pigpio.pi()
    pi.set_mode(8, pigpio.OUTPUT)  # GPIO8 is equivalent to D6

    try:
        while True:
            pi.write(8, 1)  # On
            time.sleep(1)  # seconds
            pi.write(8, 0)  # Off
            time.sleep(1)
    except KeyboardInterrupt:
        pass
    finally:
        pi.stop()

if __name__ == "__main__":
    main()
