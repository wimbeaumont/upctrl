import time
import pigpio

from upctrl_pinfunctions import *

print("start program ", {__file__})


err = init_cce_1()
if err:
    print(f"initialization of hardware failed with err {err}")
    exit(err)


set_muxout('A')  # set the routing of the signals on the FPGA board

# initialize ? 

lc = 0
while True:
    print("what to do ?")
	# do somethin 

pi.stop()
