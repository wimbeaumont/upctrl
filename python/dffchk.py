import sys
import time
import pigpio

from upctrl_pinfunctions import *


def read_print_status(rp, size):
    Pstat = [pi.read(pin) for pin in rp]
    print("current status : Qb:",Pstat[4]," Qa:",Pstat[3]," D:",Pstat[2]," CE:",Pstat[1]," clk:",Pstat[0],"\n")

def main():
    print("start program {__file__}")
    err = init_cce_1()
    if err:
        print("initialization of hardware failed with err {err}\n")
        return err

    set_muxout('A')
    pi.set_mode(D2, pigpio.OUTPUT)
    pi.write(D2, 1)
    CE = D4
    pi.set_mode(CE, pigpio.OUTPUT)
    pi.set_mode(clk3, pigpio.OUTPUT)
    pi.set_mode(D3, pigpio.OUTPUT)

    pr = [clk3, CE, D3, P3, P2]
    pi.write(CE, 1)
    pi.write(D3, 0)
    pi.write(clk3, 0)
    print("push a and press enter after each question\n")
    read_print_status(pr, 5)
    dummyread=input("push the rst button press enter when done what you expect as outputs on the LED (2 and 3)")
    read_print_status(pr, 5)
    print("CE is 1 and D3 is 0\n")
    input("will set clk3 high what you will expect to see on the LED's?\n")
    pi.write(clk3, 1)
    read_print_status(pr, 5)
    input("will set D3 high what you will expect to see on the LED's?\n")
    pi.write(D3, 1)
    read_print_status(pr, 5)
    input("will set clk3 low what you will expect to see on the LED's?\n")
    pi.write(clk3, 0)
    read_print_status(pr, 5)
    input("will set clk3 high what you will expect to see on the LED's?\n")
    pi.write(clk3, 1)
    read_print_status(pr, 5)
    input("push the rst button press enter when done what you expect as outputs on the LED (2 and 3)\n")

    lc = 0
    while True:
        if (lc % 10) == 0:
            pi.write(D3, not pi.read(P3))
        lc += 1
        pi.write(clk3, 0)
        time.sleep(0.2)
        pi.write(clk3, 1)
        time.sleep(0.2)
        pi.write(clk3, 0)
        read_print_status(pr, 5)

    gpioTerminate()

if __name__ == "__main__":
    main()

