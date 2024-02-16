
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o -lpigpio -lpthread

program to readout the counters 

*/


int main(int argc, char *argv[]){
	int counts[6];
   int ls[8];// read status 
   printf("start program %s\n\r", argv[0]);
    // init hardware 
	int err= init_cce_2();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
	setup_output_array( Dpins , 8 );
	
	const int datavalid = GPIO15;
	gpioSetMode(datavalid,PI_OUTPUT); 
	gpioWrite (datavalid , 0) ;	 
	
	const int start= GPIO14;
	gpioSetMode(start,PI_OUTPUT); 
	gpioWrite (start, 0) ;	
	printf( "set start == GPIO%d to %d \n\r",start ,gpioRead(start));
	const int ready= 22;  //gpio22
	gpioSetMode(ready,PI_OUTPUT); 
	gpioWrite (ready, 0) ;	
	
	// load the values 
    set_muxout2( 0,4); // Pulse time 
	set_outputs(Dpins, 8 , 4) ;
	gpioWrite (datavalid , 1) ;gpioWrite (datavalid , 0) ;	 //fill register 
    set_muxout2( 1,4); // wait time 
	set_outputs(Dpins, 8 , 100) ;
	gpioWrite (datavalid , 1) ;gpioWrite (datavalid , 0) ;	 //fill register 
    set_muxout2( 2,4); // Nr pulse 
	set_outputs(Dpins, 8 , 5) ;
	gpioWrite (datavalid , 1) ;gpioWrite (datavalid , 0) ;	 //fill register

	gpioWrite ( start,1) ;
	printf( "set start == GPIO%d to %d \n\r",start ,gpioRead(start));
	gpioWrite ( start,0) ;
	printf( "set start == GPIO%d to %d \n\r",start ,gpioRead(start));
	sleep( 10);
	gpioWrite ( ready,1) ;
	printf( "set ready == GPIO%d to %d \n\r",ready ,gpioRead(ready));
	gpioWrite ( ready,0) ;
	printf( "set ready == GPIO%d to %d \n\r",ready ,gpioRead(ready));
	
   gpioTerminate();
}

