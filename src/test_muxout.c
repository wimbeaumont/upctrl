#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h"
#include "cce_1_def.h" 

/*
		gcc -o test_muxout test_muxout.c -lpigpio -lpthread
	
*/



int main(int argc, char *argv[]){
	const int nr_inputs=8;
	unsigned  inputs[]= {D0,D1,D2,D3,D4,D5,D6,D7} ;
	int err= init_cce_1();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
	// these drive the inputs of the FPGA so have to defined as outputs 
	for ( int inpcnt=0; inpcnt < nr_inputs; inpcnt++) {
		err= gpioSetMode( inputs[inpcnt],PI_OUTPUT);
		if( err) { printf("can not set gpio %d to output with err %d \n\r",inputs[inpcnt], err); 
			return err;
		}
	}
   
	
	int nr_inpcomb = 1;nr_inpcomb = nr_inpcomb<<nr_inputs ;  // 2 to the power of nr_inputs 
	int ledvalue;
	err=0;
	int lc=0;	
	while (1) {
		lc++; if ( lc >= nr_inpcomb ) lc=0;
		set_outputs( inputs, nr_inputs , lc) ;
		err=set_muxout( 'A' );
		ledvalue=print_led_status(1) ;printf(" := %d err   %d ",ledvalue ,err  );
		print_dec_as_bin_array_status (ledvalue,8); printf("  lc %d  \n\r",lc);   
		sleep (1) ;	
		err|=set_muxout( 'B' );
		sleep (1) ;	
		err|=set_muxout( 'C' );
		sleep (1) ;	
		err|=set_muxout( 'D' );
		sleep (1) ;	
		if (err ) {
			printf ( "error %d occured \n\r", err);
		}
	}
	 gpioTerminate();
	return 0;  // will not be reached. 
}