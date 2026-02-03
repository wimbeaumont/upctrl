import time
import pigpio

from upctrl_pinfunctions import *

print("start program ", {__file__})


pi,err = init_cce_1()
if err:
    print(f"initialization of hardware failed with err {err}")
    exit(err)

set_muxout('A')  # set the routing of the signals on the FPGA board

pi.set_mode(P7, pigpio.INPUT)


lc = 0
while True:
    P7status = pi.read(P7)
    print(f"{lc:03d} Sw 7 gives now {P7status}")
    lc += 1
    time.sleep(1)

pi.stop()


