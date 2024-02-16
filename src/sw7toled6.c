#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "upctrl_pinfunctions.h" 


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

	int lc=0;
	while(1)  {
		//"do something" 
	}


   gpioTerminate();
}

