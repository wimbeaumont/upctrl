import time

from pr_utils import *  # includes import pigpio1  
from upctrl_pinfunctions import *

def main() :
   print("Control Green LED")
   pi, err = init_cce_1()
   if err or (pi == None ) :
        print(f"initialization of hardware failed with err {err}")
        return err

   pi.set_mode(LEDgreen, pigpio.OUTPUT)  # Set GPIO18 as output.

   try:
      while True:
        print( "Ledd on")
        pi.write(LEDgreen, 1)  # On
        time.sleep(2)  # you need some time to see it
        # remove both sleep statements to see what happens
        print( "Ledd off")
        pi.write(LEDgreen, 0)  # Off
        time.sleep(2)
   except KeyboardInterrupt:
      pass
   finally:
      pi.stop()


if __name__ == "__main__":
    main()
