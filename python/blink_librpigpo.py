import lgpio   as LG
from time import sleep


pi= LG.gpiochip_open(0)
if pi < 0 :
    print( "failed open chip " )
    exit
print("chip conneted") 

LED=18 # gpio18 

LG.gpio_claim_output( pi, LED , level=0)


while True:
    LG.gpio_write(pi,LED,0)
    sleep(1)
    LG.gpio_write(pi,LED,1)
    sleep(1)

LG.gpiochip_close(pi)
