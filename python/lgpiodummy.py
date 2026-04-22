RISING_EDGE=0
FALLING_EDGE=1

def gpiochip_open(chnr) :
    print(f">>>>>>>>>>>dummy open with gpiochip {chnr}<<<<\n\r")
    return chnr 

def gpio_claim_output( chiphandle , gpionr , level=0):
    return 0
    
def gpio_claim_input( chiphandle , gpionr , level=0):
    return 0

def gpio_write(chiphandle,gpionr,level ) :
    return level

def gpio_read(chiphandle,gpionr) :
    return 1

def gpiochip_close( chiphandle) :
    return 0




class callback:
   """
   A class to provide GPIO level change callbacks.
   """

   def __init__(self, chip, gpio, edge=RISING_EDGE, func=None):
      """
      Initialise a callback and adds it to the notification thread.
      """
      

   def cancel(self):
      """
      Cancels a callback by removing it from the notification thread.
      """