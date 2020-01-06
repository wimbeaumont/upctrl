#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o blink_led6 blink_led6.c -lpigpio -lpthread

*/


int main(int argc, char *argv[])
{
	int counts[6];
   int ls[8];// read status 
   printf("start program %s\n\r", argv[0]);
  
	int err= init_cce_2();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
    set_muxout( 0,8); 
	gpioSetMode(D0, PI_OUTPUT); 
	gpioSetMode(D1, PI_OUTPUT); 
	gpioSetMode(D2, PI_OUTPUT);
	// start (enable counters) 
	gpioWrite (D2, 1) ;		
	for (int lc=0 ;lc < 2000; lc++) {
		gpioWrite (D0, 1) ;	
		gpioWrite (D0, 0) ;	
		gpioWrite (D1, 1) ;	
		gpioWrite (D1, 0) ;
		gpioWrite (D1, 1) ;
		gpioWrite (D1, 0) ;
		gpioWrite (D0, 1) ;	
		gpioWrite (D1, 1) ;	
		gpioWrite (D0, 0) ;	
		gpioWrite (D1, 0) ;
	}
	gpioWrite (D2, 1) ;		
	// read the counters 
	for ( cnt=0;cnt < 6; cnt++){
		set_muxout( cnt,8); 	
		get_led_status_bin(ls,8);
		counts[cnt]=  ar2decvalue(ls,8);
	}
	
	printf("count1= %d\n\r", counts[0]+256*counts[1]);
	printf("count2= %d\n\r", counts[2]+256*counts[3]);
	printf("count3= %d\n\r", counts[4]+256*counts[5]);	
	
   gpioTerminate();
}

