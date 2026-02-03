from upctrl_pinfunctions import *
import pr_utils
import time


def My_logic_function(inp, insize, outp, outsize):
    if insize > 2:
        return -1
    if outsize > 2:
        return -2

    # mask inputs to 1 bit
    for i in range(insize):
        inp[i] = inp[i] & 1

    # AND logic
    outp[0] = inp[0] & inp[1]
    outp[1] = 0
    return 0


def main():
    # --- hardware setup
    pi,err = init_cce_1()
    if err:
        print(f"initialization of hardware failed with err {err}")
        return err
    err = set_muxout('A')
    if err:
        print(f"can not set the output mux correctly for this test  err {err}")
        return err
    # define test specific inputs / outputs
    nr_inputs = 2
    inputs = [D0, D1]
    if len(inputs) < nr_inputs:
        print("input pin array badly defined")
        return -nr_inputs
    # drive FPGA inputs (GPIO outputs)
    for pin in inputs:
        err = pi.set_mode(pin, pigpio.OUTPUT)
        if err:
            print(f"can not set gpio {pin} to output with err {err}")
            return err
    # number of outputs
    nr_outputs = 2
    # --- start the test
    nr_inpcomb = 1 << nr_inputs  # 2 ** nr_inputs
    bin_outp_arry = [0] * nr_outputs
    simulations_inputs = [0] * nr_inputs
    simulations_outputs = [0] * nr_outputs

    for inpcomb in range(nr_inpcomb):
        # drive FPGA inputs
        set_outputs(inputs, nr_inputs, inpcomb)

        # convert decimal value to binary array
        err,simulations_inputs=pr_utils.decvalue2binar(inpcomb, nr_inputs)

        # simulate logic
        My_logic_function(
            simulations_inputs,
            nr_inputs,
            simulations_outputs,
            nr_outputs
        )

        # read FPGA outputs
        bin_outp_arry=get_led_status_bin(nr_outputs)

        # print results
        print("input:  ", end="")
        pr_utils.print_bin_arry_status(simulations_inputs, nr_inputs)
        print(" output : ", end="")
        pr_utils.print_bin_arry_status(bin_outp_arry, nr_outputs)
        print(" simout : ", end="")
        pr_utils.print_bin_arry_status(simulations_outputs, nr_outputs)
        print()

        # allow time to observe LEDs
        time.sleep(2)

    pi.stop()
    return 0


if __name__ == "__main__":
    main()
