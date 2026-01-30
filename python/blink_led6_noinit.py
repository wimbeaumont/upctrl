import sys
import time
from cce_1_def import *  #import pin definitions
from  piwrapper import piwrap
def main():
    print("start program", sys.argv[0])


    pi = piwrap()
    if pi.geterr() < 0:
        print(f"Error in initialization {pi.geterr()}")
        return pi.geterr()
    #set mux 
    pi.set_mode(SEL0, piwrap.OUTPUT)
    pi.set_mode(SEL1, piwrap.OUTPUT)
    pi.set_mode(D6, piwrap.OUTPUT)  # GPIO9 is equivalent to D6
    pi.write(SEL0,0)
    pi.write(SEL1,0)

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
