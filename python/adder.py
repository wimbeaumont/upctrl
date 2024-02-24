import time
import pigpio
from upctrl_pinfunctions import *
import pr_utils 
def my_logic_function(inpA, inpB):
    if len(inpA) > 8 :
        return -1
    if len(inpB) > 8 :
        return -2
    
    # Make sure output is only 1 or 0.
    inpA = [x & 1 for x in inpA]
    inpB = [x & 1 for x in inpB]
    outpA = [0] * len(inpA)
    outpB = [0] * len(inpA)
    prevcarry = 0  # dummy input carry for the adder
    for nr in range(8):
        outpA[nr] = (inpA[nr] ^ inpB[nr]) ^ prevcarry  # sum is xor of the inputs of a full addr
        prevcarry = (inpA[nr] & inpB[nr]) | (((inpA[nr] ^ inpB[nr])) & prevcarry)
        outpB[nr] = prevcarry

    return outpA, outpB

def main():
	
    print("start program ", {__file__})
    err = init_cce_1()
    if err:
       print("initialization of hardware failed with err ", err)
       exit(err)
    set_muxout('C')  # set the routing of the signals on the FPGA board
    
    # Define test specific input/outputs
    nr_inputs = 8
    inputs = [D0, D1, D2, D3, D4, D5, D6, D7]  
    # These drive the inputs of the FPGA so have to be defined as outputs
    for pin in inputs:
        pi.set_mode(pin, pigpio.OUTPUT)
    carryinpin=14
    pi.set_mode(carryinpin,pigpio.OUTPUT)
    pi.write(carryinpin,0)
    nr_outputs = 8
    nr_inpcomb = 1 << nr_inputs  # power of 2
    
    bin_outp_arry = [0] * nr_outputs
    simulations_inputsA = [0] * nr_inputs
    simulations_inputsB = [0] * nr_inputs
    simulations_outputsA = [0] * nr_outputs
    simulations_outputsB = [0] * nr_outputs
    
    # Iterate over all combinations
    for inpcomb in range(nr_inpcomb):
        A = inpcomb & 0xFF
        B = 0x38
        pi.write(SEL2,0) 
        set_outputs(inputs, nr_inputs, A)
        pi.write(SEL2,1) 
        set_outputs(inputs, nr_inputs, B)
        # Convert to bin array for the simulation
        simulations_inputsA = [(A >> i) & 1 for i in range(nr_inputs)]
        simulations_inputsB = [(B >> i) & 1 for i in range(nr_inputs)]
        
        # Simulate
        simulations_outputsA, simulations_outputsB=my_logic_function(simulations_inputsA, simulations_inputsB)
        
        # Get the outputs of the circuit
        bin_outp_arry=get_led_status_bin( 8)
        ledoutdec=pr_utils.ar2decvalue(bin_outp_arry)
        simoutdec=pr_utils.ar2decvalue(simulations_outputsA)
        # Print results
        print(f"inp A: {A}:" , end='')
        pr_utils.print_bin_arry_status(simulations_inputsA, nr_inputs)
        print(f"inp B: {B}:" , end='') 
        pr_utils.print_bin_arry_status(simulations_inputsB, nr_inputs)
        print(f"out={A+B} outp: {ledoutdec}:", end='')
        pr_utils.print_bin_arry_status(bin_outp_arry, nr_inputs)
        print(f"simout: {simoutdec}:", end='')
        pr_utils.print_bin_arry_status(simulations_outputsA,nr_inputs)
        print()
        # Give some time to check the LEDs on the FPGA board
        time.sleep(1)
    print("done")
   
if __name__ == "__main__":
    main()

