import time
from pr_utils import *
from upctrl_pinfunctions import *


def my_logic_function(inp, outp):
    insize = len(inp)
    outsize = len(outp)
    if insize > 3:
        return -1
    if outsize > 2:
        return -2
    for inpcnt in range(insize):
        inp[inpcnt] = bool(inp[inpcnt] & 1)
    outp[0] = int(inp[0] & inp[1])
    outp[1] = int(not (outp[0] | inp[2]))
    return 0

def main():
    pi,err = init_cce_1()
    if err:
        print("initialization of hardware failed with err", err)
        return err
    set_muxout('A')  # set the routing of the signals on the FPGA board
    # define test specific input / outputs
    nr_inputs = 3
    inputs = [D0, D1, D2]
    #these drive the inputs of the FPGA so have to defined as outputs 
    for Dx in inputs :
        pi.set_mode(Dx, pigpio.OUTPUT)
    nr_outputs = 2
    #the output are defined in the general hardware setup 		
    simulations_inputs = [0,0,0]
    simulations_outputs = [0,0] 
    err = 0
    nr_inpcomb = 8 # 2^3
    for inpcomb in range(nr_inpcomb):
        set_outputs(inputs, nr_inputs, inpcomb)
        err,simulations_inputs=decvalue2binar(inpcomb,  nr_inputs)
        my_logic_function(simulations_inputs, simulations_outputs)
        bin_outp_arry=get_led_status_bin( 2)
        print("input: ", end='')
        print_bin_arry_status(simulations_inputs, nr_inputs)
        print("output: ", end='')
        print_bin_arry_status(bin_outp_arry, nr_outputs)
        print("simout: ", end='')
        print_bin_arry_status(simulations_outputs, nr_outputs)
        print()
        time.sleep(2)
    # gpioTerminate() is omitted in Python translation

if __name__ == "__main__":
    main()


