#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "upctrl_pinfunctions.h" 


/*

gcc -o blink_led6 blink_led6.c -lpigpio -lpthread

*/


int main(int argc, char *argv[])
{

 
   printf("start program %s\n\r", argv[0]);
 
	int err= init_cce_1();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
    set_muxout( 'A' );  // set the routing of the signals on the FPGA board 
	gpioSetMode(D6, PI_OUTPUT); // SetD6 == GPIO8 ->9? .           //PI_OUPUT is a pigpio command
	
for (;;)
  {
    gpioWrite (D6, 1) ;	// On
    sleep (1) ;		// mS
    gpioWrite (D6, 0) ;	// Off
    sleep (1) ;
  }


   gpioTerminate();
}

