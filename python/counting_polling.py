import sys
from upctrl_pinfunctions import *

def main(argv):
    ls = [0] * 8  # read status led status

    clkdiv = 200
    if len(sys.argv) > 1:
        try:
            clkdiv = int(sys.argv[1])
            if clkdiv < 0 or clkdiv > 256:
                clkdiv = 200
        except ValueError:
            clkdiv = 200

    print(f"start program with {sys.argv[0]} clkdiv {clkdiv}\n\r")

    pi,err = init_cce_2()
    if err:
        print(f"initialization of hardware failed with err {err} \n\r")
        return err

    set_muxout2(6, 8)
    err = setup_output_array(Dpins, 8)
    if err:
        print(f"initialization of  D's  failed with err {err} \n\r")
        return err

    set_outputs(Dpins, 8, clkdiv)  # set dividing value
    pi.set_mode(GPIO15, piwrap.OUTPUT)
    pi.set_mode(2, piwrap.OUTPUT) # used for checking loop speed 
    pi.write(GPIO15, 1)  # enable writing register
    pi.write(GPIO15, 0)  # disable writing register

    lcnt = 0
    counter = [0, 0, 0]
    onedet = [0, 0, 0]

    coinc = 0
    c_onedet = 0 
    andcnt = 0

    while lcnt < int(3 * 1e6):
        lcnt += 1
        #print("lcnt ", lcnt, "\r", end='')
        pi.write(2,1)
        ls=get_led_status_bin( 3)  # led status == P
        pi.write(2,0)
        for lc in range(3):  # there are pulse inputs
            if ls[lc]:
                if onedet[lc] == 0:
                    onedet[lc] = 1
                    counter[lc] += 1
            else:
                onedet[lc] = 0

        coinc = ls[0] and ls[1]
        if coinc:
            if c_onedet == 0:
                c_onedet = 1
                andcnt += 1
        else:
            c_onedet = 0

    for lc in range(3):
        print(f"cnt {lc} =  {counter[lc]} ", end='')
    print(f"andcnt = {andcnt} \n\r")

    pi.stop()
    return 0


# Note: The following functions and variables are assumed to be defined elsewhere in the Python environment:
# init_cce_2(), set_muxout2(), setup_output_array(), set_outputs(), gpioSetMode(), gpioWrite(), get_led_status_bin(), gpioTerminate()
# Dpins, GPIO15, PI_OUTPUT

    
if __name__ == "__main__":
    import sys
    main(sys.argv)

