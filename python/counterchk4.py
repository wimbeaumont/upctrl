import sys
from upctrl_pinfunctions import *
from pr_utils import ar2decvalue

def main(argv):
    RSTcnt = GPIO15 #renemae pin to RSTcnt for clearity
    RegDataValid = GPIO14 #renemae pin to RegDataValid for clearity
    bytesel0 = SEL2
    bytesel1 = clk1
    counts = [0] * 6
    ls = [0] * 8  # read status
    print(f"start program {argv[0]}\n\r")

    pi,err = init_cce_2()
    if err:
        print(f"initialization of hardware failed with err {err} \n\r")
        return err

    set_muxout2(6, 8)
    err = setup_output_array(Dpins, 8) 
    if err:
        print(f"initialization of  D's  failed with err {err} \n\r")
        return err
    pi.set_mode(bytesel0, piwrap.OUTPUT)
    pi.set_mode(bytesel1, piwrap.OUTPUT)
    pi.set_mode(RSTcnt, piwrap.OUTPUT)
   
    pi.write(bytesel0, 0)
    pi.write(bytesel1, 0) 
    pi.write( RegDataValid, 0) 
    pi.write(SEL0, 0) # select settings register
    pi.write(SEL1, 1)
    # D0 =  Coincedence = AND at  input ,  D1,D2 1,1 input sel ext  ,  D3 =1 disable window timing 
    settings=[0,0,0,1,0,0,0,0]
    set_D_outputsB ( 8, settings)
    pi.write( RegDataValid, 1)
    pi.write( RegDataValid, 0)  
    pi.write(RSTcnt, 1) 
    pi.write(RSTcnt, 0) 
    set_muxout2( 3,0);

    # start (enable counters)
    pi.write(D2, 1)
    for _ in range(1986):
        pi.write(D0, 1)
        pi.write(D0, 0)
        pi.write(D1, 1)
        pi.write(D1, 0)
        pi.write(D1, 1)
        pi.write(D1, 0)
        pi.write(D0, 1)
        pi.write(D1, 1)
        pi.write(D0, 0)
        pi.write(D1, 0)
    pi.write(D2, 0)

    # read the counters
    for cnt in range(6):
        set_muxout2(cnt, 8)
        ls=get_led_status_bin( 8)
        counts[cnt] = ar2decvalue(ls)
    counts = [0] * 6
    ls = [0] * 8

    for cnt in range(3):
        set_muxout2(cnt, 4)
        pi.write(bytesel0, 0)
        pi.write(bytesel1, 0)
        ls=get_led_status_bin( 8)
        counts[2 * cnt] = ar2decvalue(ls)
        pi.write(bytesel0, 1)
        pi.write(bytesel1, 0)
        ls=get_led_status_bin( 8)
        counts[2 * cnt + 1] = ar2decvalue(ls)

    print(f"{counts[1]} {counts[0]} count1= {counts[0] + 256 * counts[1]}\n\r")
    print(f"{counts[3]} {counts[2]}  count2= {counts[2] + 256 * counts[3]}\n\r")
    print(f"{counts[5]} {counts[4]}  count3= {counts[4] + 256 * counts[5]}\n\r")
    pi.write(bytesel0, 0) 
    pi.write(bytesel1, 0)
    set_muxout2( 0,4)
    pi.stop()
    return 0


if __name__ == "__main__":
    import sys
    main(sys.argv)
