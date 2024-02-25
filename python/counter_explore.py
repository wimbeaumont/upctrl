import time
import pigpio
from upctrl_pinfunctions import *
import pr_utils 

def My_logic_function(inpA, inpB, insize, outpA, outpB, outsize):
    if insize > 8:
        return -1
    if outsize > 8:
        return -2
    for inpcnt in range(insize):
        inpA[inpcnt] = inpA[inpcnt] & 1
        inpB[inpcnt] = inpB[inpcnt] & 1
    prevcarry = 0
    for nr in range(8):
        outpA[nr] = (inpA[nr] ^ inpB[nr]) ^ prevcarry
        prevcarry = (inpA[nr] & inpB[nr]) | ((inpA[nr] ^ inpB[nr]) & prevcarry)
        outpB[nr] = prevcarry
    return 0

def main():
    
    print("start program ", {__file__})
    err = init_cce_1()
    if err:
       print("initialization of hardware failed with err ", err)
       exit(err)
    set_muxout('B')  # set the routing of the signals on the FPGA board
    
    #special  signals 
    DSEL = D5 #is an output for loading a preset value 
    #Selector for the Multiplexer: The input of the flop-flop will be 
    #either the inverted output of the flip-flop (if DSEL==1), or a starting value for the counter given by D0-D3 (if DSEL==0).
    DCE= D4
    m42SEL= GPIO22 
    pi.set_mode(DSEL, pigpio.OUTPUT)
    pi.set_mode(DCE, pigpio.OUTPUT)
    pi.set_mode(clk1, pigpio.OUTPUT)
    pi.set_mode(m42SEL, pigpio.OUTPUT)
    
    pi.write(DSEL, 0)
    pi.write(DCE, 1)
    pi.write(clk1, 0)
    pi.write(m42SEL, 1)
    
    inputs = [D0, D1, D2, D3]
    for inpcnt in range(len(inputs)):
        pi.set_mode(inputs[inpcnt], pigpio.OUTPUT)
    
    bin_outp_arry = [0] * 8
    
    for cnt in range(20):
        pi.write(clk1, 0)
        print(f"cnt = {cnt}, clk = {pi.read(clk1)}")
        # Assuming print_led_status(2) is a function that prints LED status
        print_led_status(2)
        time.sleep(1)
        
        pi.write(clk1, 1)
        print(f"cnt_= {cnt}, clk = {pi.read(clk1)}")
        print_led_status(2)
        
        time.sleep(1)
    
    pi.stop()

if __name__ == "__main__":
    main()

