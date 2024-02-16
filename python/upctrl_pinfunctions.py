import pigpio
import ccd_1_def
# Assuming pigpio is initialized and available as pi
pi = pigpio.pi()

def init_cce_1():
    err = pi.connected
    if not err:
        return -1
    err = init_pin2(iopins['mux_out_s0'], SEL0, pigpio.OUTPUT)
    if err < 0:
        return err
    err = init_pin2(iopins['mux_out_s1'], SEL1, pigpio.OUTPUT)
    if err < 0:
        return err
    for cnt in range(8):
        err = init_pin2(iopins['led'][cnt], [P0, P1, P2, P3, P4, P5, P6, P7][cnt], pigpio.INPUT)
        if err < 0:
            return err
    return err

def init_cce_2():
	#do all init as for pr1  + 
    err = init_cce_1()
    if err < 0:
        return err
    err = init_pin2(iopins['mux_out_s2'], SEL2, pigpio.OUTPUT)
    if err < 0:
        return err
    return err

def get_led_status_bin():
    ls = [pi.read(iopins['led'][cnt]['pin']) for cnt in range(8)]
    return ls

# read back the input of a pin array, result is stored in stat 
def get_inp_status_bin(stat, pinno):
    for cnt in range(len(pinno)):
        stat[cnt] = pi.read(pinno[cnt])

# reads the pins that are called led 0 .. 7 and print the  satatus if print > 0 
# no check if it is initialized for the moment 
def print_led_status(print_flag):

    ls = get_led_status_bin()
    if print_flag > 0:
        print(ls)  # Assuming print_bin_arry_status is similar to printing the list
    if print_flag > 1:
        print("\n\r")
    return sum(val * (2 ** idx) for idx, val in enumerate(ls))

#standard input for FPGA 
Dpins = [13, 26, 19, 6, 11, 10, 9, 5]
Ds = [{'pin': pin, 'initialized': False} for pin in Dpins]

#function to initiate  a array of outputs  ( inputs for the FPGA) 
def setup_output_array(pinarry):
    if len(pinarry) > 8:
        return -20
    for c, pin in enumerate(pinarry):
        init_pin2(Ds[c], pin, pigpio.OUTPUT)
        # Assuming init_pin is similar to init_pin2
    return 0

# function to set a number of output
#	pins :  array of  pin numbers  of the io's  to be set  
#	nrpins : nr pins to be set ( should be equal as the  size of the pins array )
#	value : the decimal value to be set  rolls over at 2 to the power nr_pins

def set_outputs(pins, value):
    value_array = [int(x) for x in bin(value)[2:].zfill(len(pins))]
    for pincnt, pin in enumerate(pins):
        pi.write(pin, value_array[pincnt])

def set_D_outputs(nrpins, value):
    pinnr = [Ds[pcnt]['pin'] for pcnt in range(nrpins)]
    set_outputs(pinnr, value)

#set a number of outputs depending on the array  value ( each element is a bit , 0 = 0 else 1 
def set_outputsB(pins, values):
    for pincnt, pin in enumerate(pins):
        bitvalue = 1 if values[pincnt] > 0 else 0
        pi.write(pin, bitvalue)

def set_D_outputsB(nrpins, values):
    pinnr = [Ds[pcnt]['pin'] for pcnt in range(nrpins)]
    set_outputsB(pinnr, values)

def set_muxout2(a, nrinp):
    err = 0
    if iopins['mux_out_s0']['initialized'] and iopins['mux_out_s1']['initialized']:
        if nrinp == 4:
            if a == 0:
                pi.write(iopins['mux_out_s0']['pin'], 0)
                pi.write(iopins['mux_out_s1']['pin'], 0)
            elif a == 1:
                pi.write(iopins['mux_out_s0']['pin'], 1)
                pi.write(iopins['mux_out_s1']['pin'], 0)
            elif a == 2:
                pi.write(iopins['mux_out_s0']['pin'], 0)
                pi.write(iopins['mux_out_s1']['pin'], 1)
            elif a == 3:
                pi.write(iopins['mux_out_s0']['pin'], 1)
                pi.write(iopins['mux_out_s1']['pin'], 1)
             else:
                err = -3
        elif nrinp == 8:
            if a == 0:
                pi.write(iopins['mux_out_s0']['pin'], 0)
                pi.write(iopins['mux_out_s1']['pin'], 0)
                pi.write(iopins['mux_out_s2']['pin'], 0)
            elif a == 1:
                pi.write(iopins['mux_out_s0']['pin'], 1)
                pi.write(iopins['mux_out_s1']['pin'], 0)
                pi.write(iopins['mux_out_s2']['pin'], 0)
            elif a == 2:
                pi.write(iopins['mux_out_s0']['pin'], 0)
                pi.write(iopins['mux_out_s1']['pin'], 1)
                pi.write(iopins['mux_out_s2']['pin'], 0)
            elif a == 3:
                pi.write(iopins['mux_out_s0']['pin'], 1)
                pi.write(iopins['mux_out_s1']['pin'], 1)
                pi.write(iopins['mux_out_s2']['pin'], 0)
            elif a == 4:
                pi.write(iopins['mux_out_s0']['pin'], 0)
                pi.write(iopins['mux_out_s1']['pin'], 0)
                pi.write(iopins['mux_out_s2']['pin'], 1)
            elif a == 5:
                pi.write(iopins['mux_out_s0']['pin'], 1)
                pi.write(iopins['mux_out_s1']['pin'], 0)
                pi.write(iopins['mux_out_s2']['pin'], 1)
            elif a == 3:
                pi.write(iopins['mux_out_s0']['pin'], 0)
                pi.write(iopins['mux_out_s1']['pin'], 1)
                pi.write(iopins['mux_out_s2']['pin'], 1)
            elif a == 4:
                pi.write(iopins['mux_out_s0']['pin'], 1)
                pi.write(iopins['mux_out_s1']['pin'], 1)
                pi.write(iopins['mux_out_s2']['pin'], 1)
            else:
                err = -2
        else:  # end switch
            err = -2
    else:
        err = -1
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

