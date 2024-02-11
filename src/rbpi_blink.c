#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>


#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o rbpi_blink rbpi_blink.c -lpigpio -lpthread

*/


int main(int argc, char *argv[])
{

 
   printf("Monitoring gpios");
 
	int err= init_cce_1();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
   
	gpioSetMode(LEDgreen, PI_OUTPUT); // Set LEDgreen== GPIO18 as output.
	
for (;;)
  {
    gpioWrite (LEDgreen, 1) ;	// On
    sleep (1) ;		// mS
    gpioWrite (LEDgreen, 0) ;	// Off
    sleep (1) ;
  }


   gpioTerminate();
}

