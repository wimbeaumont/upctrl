#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 

/*
		gcc -o check_comlogic check_comlogic.c -lpigpio -lpthread
	
*/

int My_logic_function ( int* inp , int insize, int*  outp, int outsize  ) {
	if ( insize > 3 ) return -1; 
	if ( outsize > 2 ) return -2; 
	// make sure input is only 1 or 0 
	for ( int inpcnt=0; inpcnt < insize ; inpcnt++) {
			inp[inpcnt] = inp[inpcnt] & 1;
	}
	outp[0] = inp[0] & inp[1]; // bit wize or 
	outp[1] = ! (outp[0]  | inp[2]) ; 
	return 0;
} 
	


int main(int argc, char *argv[]){
// --- this is setup the hardware for the test 
	int err= init_cce_1();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
	err=set_muxout( 'A' );
	if (err) {
		printf("can not set the output mux correctly for this test  err %d \n\r", err);
		return err; 
	}
// define test specific input / outputs
	// now define my inputs 
	const int nr_inputs=3;
	unsigned  inputs[]= {D0,D1,D2} ;
	if (sizeof(inputs) / sizeof(inputs[0]) < nr_inputs) { 
		printf("input pin array badly defined \n\r");
		return -nr_inputs ;
	}
// these drive the inputs of the FPGA so have to defined as outputs 
	for ( int inpcnt=0; inpcnt < nr_inputs; inpcnt++) {
		err= gpioSetMode( inputs[0],PI_OUTPUT);
		if( err) { printf("can not set gpio %d to output with err %d \n\r",inputs[inpcnt], err); 
			return err;
		}
	}
   
   // the output are defined in the general hardware setup 		
   // we need only 1 output but we use 2 , msb is always 1 in the simulation so we get errors in the test 
	const int nr_outputs=2; 
	
// -- here start the test 	
	int nr_inpcomb = 1;nr_inpcomb = nr_inpcomb<<nr_inputs ;  // 2 to the power of nr_inputs 
	int bin_outp_arry[nr_outputs];
	int simulations_inputs[nr_inputs];
	int simulations_outputs[nr_outputs];
	err=0;	
	// itterate  over all combinations 
    for (int  inpcomb=0 ; inpcomb < nr_inpcomb ; inpcomb++) {
		set_outputs( inputs, nr_inputs , inpcomb) ;
		// convert to bin array for the simulation 
		decvalue2binar(inpcomb ,simulations_inputs  ,nr_inputs );
		// simulate 
		My_logic_function ( simulations_inputs , nr_inputs,simulations_outputs, nr_outputs  );
		// get the outputs of the circuit 
		get_led_status_bin( bin_outp_arry, 2 ); 
		// now we print all in a format so we can easy check it with the LED status 
		printf ("input:  ");
		print_bin_arry_status (simulations_inputs , nr_inputs );
		printf(" output : ");
		print_bin_arry_status (bin_outp_arry, nr_outputs);
		printf(" simout : ");
		print_bin_arry_status (simulations_outputs, nr_outputs);
		printf("\n\r");
		//give some  time to check the LED's on the FPGA board 
		sleep(2);
		
		
	}
	 gpioTerminate();
	return 0;  // will not be reached. 
}