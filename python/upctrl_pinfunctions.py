import pigpio
from cce_1_def import *
import pr_utils 
# Assuming pigpio is initialized and available as pi
pi = pigpio.pi()


def init_cce_1():
    err = pi.set_mode(SEL0, pigpio.OUTPUT)
    if err < 0:
        return err
    err = pi.set_mode(SEL1, pigpio.OUTPUT)
    if err < 0:
        return err
    for cnt in range(8):
        err = pi.set_mode(ledpinnr[cnt], pigpio.INPUT)
        if err < 0:
            return err
    return err

def init_cce_2():
    err = init_cce_1()
    if err < 0:
        return err
    err = pi.set_mode(SEL2, pigpio.OUTPUT)
    if err < 0:
        return err
    return err

def get_led_status_bin(size):
    ls = []
    for cnt in range(size):
        ls.append(pi.read(ledpinnr[cnt]))
    #print(ls)
    return ls

def get_inp_status_bin(stat, pinno, size):
    for cnt in range(size):
        stat.append(pi.read(pinno[cnt]))

def print_led_status(print_flag):
    ls = get_led_status_bin(8)
    if print_flag > 0:
        pr_utils.print_bin_arry_status(ls,len(ls))
    if print_flag > 1:
        print("\n\r")
    return pr_utils.ar2decvalue(ls)

def setup_output_array(pinarry, size):
    err = 0
    if size > 8:
        err = -20
    else:
        for c in range(size):
            err = pi.set_mode(pinarry[c], pigpio.OUTPUT)
            if err:
                break
    return err

def set_outputs(pins, nrpins, value):
    err,value_array = pr_utils.decvalue2binar(value, nrpins)
    for pincnt in range(nrpins):
        pi.write(pins[pincnt], value_array[pincnt])

def set_outputsB(pins, nrpins, value):
    for pincnt in range(nrpins):
        bitvalue = 1 if value[pincnt] > 0 else 0
        pi.write(pins[pincnt], bitvalue)

def set_muxout2(a, nrinp):
    err = 0
    if nrinp == 4:
        if a == 0:
            pi.write(SEL0, 0)
            pi.write(SEL1, 0)
        elif a == 1:
            pi.write(SEL0, 1)
            pi.write(SEL1, 0)
        elif a == 2:
            pi.write(SEL0, 0)
            pi.write(SEL1, 1)
        elif a == 3:
            pi.write(SEL0, 1)
            pi.write(SEL1, 1)
        else:
            err = -3
    elif nrinp == 8:
        if a == 0:
            pi.write(SEL0, 0)
            pi.write(SEL1, 0)
            pi.write(SEL2, 0)
        elif a == 1:
            pi.write(SEL0, 1)
            pi.write(SEL1, 0)
            pi.write(SEL2, 0)
        elif a == 2:
            pi.write(SEL0, 0)
            pi.write(SEL1, 1)
            pi.write(SEL2, 0)
        elif a == 3:
            pi.write(SEL0, 1)
            pi.write(SEL1, 1)
            pi.write(SEL2, 0)
        elif a == 4:
            pi.write(SEL0, 0)
            pi.write(SEL1, 0)
            pi.write(SEL2, 1)
        elif a == 5:
            pi.write(SEL0, 1)
            pi.write(SEL1, 0)
            pi.write(SEL2, 1)
        elif a == 6:
            pi.write(SEL0, 0)
            pi.write(SEL1, 1)
            pi.write(SEL2, 1)
        elif a == 7:
            pi.write(SEL0, 1)
            pi.write(SEL1, 1)
            pi.write(SEL2, 1)
        else:
            err = -2
    else:
        err = -2
    return err

def set_muxout(a):
    err = 0
    inpnr = 0
    if a == 'A':
        inpnr = 0
    elif a == 'B':
        inpnr = 1
    elif a == 'C':
        inpnr = 2
    elif a == 'D':
        inpnr = 3
    else:
        err = -3
    if err == 0:
        err = set_muxout2(inpnr, 4)
    return err


