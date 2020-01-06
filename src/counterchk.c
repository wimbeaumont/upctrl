#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o counterchk counterchk.c -lpigpio -lpthread

program to readout the counters 

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
    set_muxout2( 0,8); 
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
	gpioWrite (D2, 0) ;		
	// read the counters 
	for (int  cnt=0;cnt < 6; cnt++){
		set_muxout2( cnt,8);
		printf( "cnt %d %d ,%d ,%d \n\r",cnt, gpioRead(MUXSEL2) ,	gpioRead(MUXSEL1) ,gpioRead(MUXSEL0) );
		get_led_status_bin(ls,8);
		counts[cnt]=  ar2decvalue(ls,8);
	}
	
	printf("%d %d count1= %d\n\r", counts[1], counts[0],counts[0]+256*counts[1]);
	printf("%d %d  count2= %d\n\r", counts[3], counts[2],counts[2]+256*counts[3]);
	printf("%d %d  count3= %d\n\r", counts[5], counts[4],counts[4]+256*counts[5]);	
	
   gpioTerminate();
}

