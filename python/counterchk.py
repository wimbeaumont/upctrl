import sys
from upctrl_pinfunctions import *
from pr_utils import ar2decvalue

def main(argv):
    InpSel = clk3 #renemae pin to InpSel for clearity
    RSTcnt = GPIO14
    counts = [0] * 6
    ls = [0] * 8  # read status
    print(f"start program {argv[0]}\n\r")

    pi,err = init_cce_2()
    if err:
        print(f"initialization of hardware failed with err {err} \n\r")
        return err

    set_muxout2(6, 8)
    err = setup_output_array(Dpins, 3) # set D0,D1,D2 as outputs
    if err:
        print(f"initialization of  D's  failed with err {err} \n\r")
        return err
    pi.set_mode(InpSel, piwrap.OUTPUT)
    pi.write(InpSel, 0)
    pi.set_mode(RSTcnt, piwrap.OUTPUT)
    pi.write(RSTcnt, 0)

    # start (enable counters)
    pi.write(D2, 1)
    for _ in range(2000):
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

    print(f"{counts[1]} {counts[0]} count1= {counts[0] + 256 * counts[1]}\n\r")
    print(f"{counts[3]} {counts[2]}  count2= {counts[2] + 256 * counts[3]}\n\r")
    print(f"{counts[5]} {counts[4]}  count3= {counts[4] + 256 * counts[5]}\n\r")

    pi.stop()
    return 0


if __name__ == "__main__":
    import sys
    main(sys.argv)
