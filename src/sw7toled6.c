#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o sw7toled6 sw7toled6.c -lpigpio -lpthread

*/


int main(int argc, char *argv[]) {

 
   printf("start program %s\n\r", argv[0]);
 
	int err= init_cce_1();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
    set_muxout( 'A' );  // set the routing of the signals on the FPGA board 
	// gpioSetMode(P7, PI_INPUT); // this is already done in init-cce_1


	int P7status = 0;
	int lc=0;
	while(1)  {
		P7status = gpioRead(P7); 
		printf("%03d Sw 7 gives now %d \n\r",lc++,P7status);
		gpioWrite(D6, P7status);
		sleep(1);
	}


   gpioTerminate();
}

