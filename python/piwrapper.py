import lgpio   as LG
#import lgpiodummy   as LG

# Assuming pigpio is initialized and available as pi
class piwrap :
    OUTPUT=1
    INPUT=0
    RISING_EDGE=LG.RISING_EDGE
    FALLING_EDGE=LG.FALLING_EDGE
    def __init__(self) :
        self.chiphandle=LG.gpiochip_open(0)
        self.err=0
        if self.chiphandle < 0 :
           self.err=self.chiphandle
        return
    
    def geterr(self) :
        return self.err
    
    def return_chiphandl(self) :
        return self.chiphandle
        
    def set_mode(self , gpionr , direction) :
        err=0
        if direction ==  piwrap.OUTPUT :
             err=LG.gpio_claim_output( self.chiphandle , gpionr , level=0)
        else :
             err=LG.gpio_claim_input( self.chiphandle , gpionr ) # how to add pull up ?
        return  err
    
    def write( self, gpionr, level) :
        LG.gpio_write(self.chiphandle,gpionr,level)

    def read( self, gpionr) :
        return LG.gpio_read(self.chiphandle,gpionr)
    def group_claim_input(self, inputchlist) :
        return LG.group_claim_input(self.chiphandle,inputchlist)
    def group_read(self,gpiolst) :
        return LG.group_read(self.chiphandle,gpiolst)
    def stop( self) :
        LG.gpiochip_close( self.chiphandle)
        return
    
    def callback( self, gpionr, edge, func) :
        return LG.callback( self.chiphandle, gpionr, edge, func)    
    #cb0 = lgpio.callback(h, P0, lgpio.RISING_EDGE, myInterrupt0)
    


def main():
    pi=piwrap()
    if pi.geterr() < 0:
        print(f"Error in initialization {pi.geterr()}")
        exit(-1) 

    print(f"Chip handle is {pi.return_chiphandl()}")

if __name__ == "__main__":
    main()
