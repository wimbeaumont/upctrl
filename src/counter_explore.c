#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>

#include "pr_utils.h" 
#include "cce_1_def.h" 

/*
		gcc -o adder adder.c  -lpigpio -lpthread
	
*/

int My_logic_function ( int* inpA , int* inpB , int insize, int*  outpA, int* outpB, int outsize  ) {
	if ( insize > 8 ) return -1; 
	if ( outsize > 8 ) return -2; 
	for ( int inpcnt=0; inpcnt < insize ; inpcnt++) {
			inpA[inpcnt] = inpA[inpcnt] & 1;
			inpB[inpcnt] = inpB[inpcnt] & 1;
	}
	int prevcarry=0; //dummy input carry for the adder 
	for ( int nr = 0 ; nr < 8 ; nr++) {
		// define here a full adder  nr is the follow nr of the adder 
		outpA[nr] = (inpA[nr] ^ inpB[nr]) ^ prevcarry ;  // sum is xor of the inputs of a full addr 
		prevcarry=(inpA[nr] & inpB[nr]) | (( (inpA[nr] ^ inpB[nr])) & prevcarry);
		outpB[nr]=prevcarry;
	}
	return 0;
} 
	


int main(int argc, char *argv[]){
// --- this is setup the hardware for the test 
	int err= init_cce_1();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
	err=set_muxout( 'B' );  // mux_8_4 has tobe in position B to get the counters 
	if (err) {
		printf("can not set the output mux correctly for this test  err %d \n\r", err);
		return err; 
	}
// define test specific input / outputs
	// now define my inputs 
	const int nr_inputs=4;
	unsigned  inputs[]= {D0,D1,D2,D3} ; // preset for the counters inputs for the counter
	if (sizeof(inputs) / sizeof(inputs[0]) < nr_inputs) { 
		printf("input pin array badly defined \n\r");
		return -nr_inputs ;
	}
// these drive the inputs of the FPGA so have to defined as outputs 
	for ( int inpcnt=0; inpcnt < nr_inputs; inpcnt++) {
		err= gpioSetMode( inputs[inpcnt],PI_OUTPUT);
		if( err) { printf("can not set gpio %d to output with err %d \n\r",inputs[inpcnt], err); 
			return err;
		}
	}
    // special  signals 
	const int DSEL = D5 ; // is a output for loading a preset value 
	gpioSetMode( DSEL , PI_OUTPUT);
	gpioWrite (DSEL, 0) ;	
	const int DCE= D4;  // count enable signal
	gpioSetMode( DCE  , PI_OUTPUT);
	gpioWrite (DCE, 1) ;	 // has to be active
    // the clock is an output for the RP 
	gpioSetMode( clk1 , PI_OUTPUT);
	gpioWrite (clk1, 0) ;	
	// the mux control  for the mux4_2
	const int m42SEL= GPIO22 ;
	gpioSetMode( m42SEL  , PI_OUTPUT);
	gpioWrite (m42SEL, 1) ;	

	set_outputs( inputs, nr_inputs , 4) ;	
	const int nr_status=8; 
	int bin_outp_arry[nr_status]; // result array 
// -- here start the test 	
	for (int cnt =0;cnt < 20;cnt++){
		gpioWrite (clk1, 0) ;	
		printf ("cnt = %3d , clk= %d ",cnt, gpioRead(clk1));
		print_led_status (2);
		//sleep(1);
		gpioWrite (clk1, 1) ;	
		printf ("cnt = %3d , clk= %d ",cnt, gpioRead(clk1));
		print_led_status (2);
		sleep(1);
	}
	
	
	 gpioTerminate();
	return 0;  // will not be reached. 
}