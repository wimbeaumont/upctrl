import time
from upctrl_pinfunctions import *

# globalCounter:
# Global variable to count interrupts
globalCounter = [0, 0, 0]
interrupts_iscalled = 0

# Interrupt callback functions
def myInterrupt0(gpio, level, tick):
    global globalCounter
    interrupts_iscalled = 1
    globalCounter[0] += 1

def myInterrupt1(gpio, level, tick):
    global globalCounter
    interrupts_iscalled=1
    globalCounter[1] += 1

def myInterrupt2(gpio, level, tick):
    global globalCounter
    interrupts_iscalled=1
    globalCounter[2] += 1

def main(argv):
    clkdiv = 200
    if len(argv) > 1:
        try:
            clkdiv = int(argv[1])
            if clkdiv < 1 or clkdiv > 256:
                clkdiv = 200
        except ValueError:
            clkdiv = 200

    print(f"start program with {argv[0]} clkdiv {clkdiv}")

    # Open lgpio pi handle (0 for /dev/gpiopi0)
    pi,err = init_cce_2()
    if err < 0:
        print(f"Unable to open gpiopi: {pi}")
        return 1

    
    set_muxout2(6, 8)

    err = setup_output_array(Dpins, 8)
    if err:
        print(f"initialization of D's failed with err {err}")
        return err

    set_outputs(Dpins, 8, clkdiv)

    # Set GPIO15 as output and write 1 then 0
    pi.set_mode(GPIO15, piwrap.OUTPUT)
    pi.write(GPIO15, 0)  # to make sure should be default 0
    pi.write(GPIO15, 1)  # enable writing register
    pi.write(GPIO15, 0)  # disable writing register
    
    # Setup interrupts on P0, P1, P2 for rising edge
    # Using lgpio callback functions
    cb0 = pi.callback( P0, piwrap.RISING_EDGE, myInterrupt0)
    if cb0 == None :
        print(f"Unable to setup ISR P0")
        return -4
    cb1 = pi.callback( P1, piwrap.RISING_EDGE, myInterrupt1)
    if cb1 == None :
        print(f"Unable to setup ISR P1")
        return -4
    
    cb2 = pi.callback( P2, piwrap.RISING_EDGE, myInterrupt2)
    if cb2 == None :
        print(f"Unable to setup ISR P2")
        return -4
    
    print("Waiting ... ", end="", flush=True)
    time.sleep(3)
    print("done")

    print(f"counters : {globalCounter[0]}  {globalCounter[1]} {globalCounter[2]} ,  {interrupts_iscalled}  ")

    # Cancel callbacks (deactivate interrupts)
    cb0.cancel()
    cb1.cancel()
    cb2.cancel()

    
    # Close pi handle
    pi.stop()

    return 0

if __name__ == "__main__":
    import sys
    main(sys.argv)
