import time

from upctrl_pinfunctions import *

print("start program ", {__file__})


pi,err = init_cce_1()
if err:
    print(f"initialization of hardware failed with err {err}")
    exit(err)


set_muxout('A')  # set the routing of the signals on the FPGA board

# initialize specific input / outputs ?

lc = 0
while True:
    print("what to do ?")
	# do somethin 

pi.stop()
