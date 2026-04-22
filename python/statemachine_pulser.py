import time
from upctrl_pinfunctions import *
#from pr_utils import ar2decvalue


def main(argv):
    
    print(f"start program {argv[0]}\n\r")
    
    # init hardware
    pi,err = init_cce_2()
    if err:
        print(f"initialization of hardware failed with err {err} \n\r")
        return err

    setup_output_array(Dpins, 8)

    datavalid = GPIO15
    pi.set_mode(datavalid, piwrap.OUTPUT)
    pi.write(datavalid, 0)

    start = GPIO14
    pi.set_mode(start, piwrap.OUTPUT)
    pi.write(start, 0)
    print(f"set start == GPIO{start} to {pi.read(start)} \n\r")

    ready = GPIO22
    pi.set_mode(ready, piwrap.OUTPUT)
    pi.write(ready, 0)

    # load the values
    set_muxout2(0, 4)  # Pulse time
    set_outputs(Dpins, 8, 4)
    pi.write(datavalid, 1)
    pi.write(datavalid, 0)  # fill register

    set_muxout2(1, 4)  # wait time
    set_outputs(Dpins, 8, 10)
    pi.write(datavalid, 1)
    pi.write(datavalid, 0)  # fill register

    set_muxout2(2, 4)  # Nr pulse
    set_outputs(Dpins, 8, 7)
    pi.write(datavalid, 1)
    pi.write(datavalid, 0)  # fill register
    
    set_muxout2(3, 4)  # spare reg
    set_outputs(Dpins, 8, 8)
    pi.write(datavalid, 1)
    pi.write(datavalid, 0)  # fill register

    pi.write(start, 1)
    print(f"set start == GPIO{start} to {pi.read(start)} \n\r")
    pi.write(start, 0)
    print(f"set start == GPIO{start} to {pi.read(start)} \n\r")

    time.sleep(10)

    pi.write(ready, 1)
    print(f"set ready == GPIO{ready} to {pi.read(ready)} \n\r")
    pi.write(ready, 0)
    print(f"set ready == GPIO{ready} to {pi.read(ready)} \n\r")

    pi.stop()

if __name__ == "__main__":
    import sys
    main(sys.argv)
