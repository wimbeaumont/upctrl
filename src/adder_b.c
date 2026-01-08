#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>

#include "pr_utils.h" 
#include "upctrl_pinfunctions.h" 

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
	err=set_muxout( 'A' );
	if (err) {
		printf("can not set the output mux correctly for this test  err %d \n\r", err);
		return err; 
	}
// define test specific input / outputs
	// now define my inputs 
	const int nr_inputs=8;
	unsigned  inputs[]= {D0,D1,D2,D3,D4,D5,D6,D7} ;
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
   
   // define the selection output 
    
   
   // the output are defined in the general hardware setup 		
   // we need only 1 output but we use 2 , msb is always 1 in the simulation so we get errors in the test 
	const int nr_outputs=8; 
	
// -- here start the test 	
	int nr_inpcomb=1; nr_inpcomb= nr_inpcomb<<nr_inputs ;  // power of 2 
	int bin_outp_arry[nr_outputs];
	int simulations_inputsA[nr_inputs];
	int simulations_inputsB[nr_inputs];
	int simulations_outputsA[nr_outputs];
	int simulations_outputsB[nr_outputs];
	set_muxout('C');
	err=0;	
	// itterate  over all combinations 
    
    
    
    //Choose A and B
	const int nr_arg_expected =2;
	int intarg[nr_arg_expected];
	// first check if there are enough arguments, we expect 2 
	// the program call itself is always the first argument so 
	// we need more than 2 
    if ( argc > nr_arg_expected ) {		
		for ( int nr_arg=0; nr_arg < nr_arg_expected ; nr_arg++) {
			intarg[nr_arg] = atoi(argv[nr_arg+1]);
			// check here if the input is reasonable if not exit 
		}
	}else { printf(" program %s need at least %d arguments  \n\r", argv[0], nr_arg_expected );
			return -1;
	}
	printf("start program %s with arguments :\n\r ", argv[0]);
	int A = intarg[0];
	int B = intarg[1];
 
	printf("A: %d \t B:%d \n", A, B);

	gpioWrite( SEL2, 0);
	set_outputs( inputs, nr_inputs , A) ;
	gpioWrite( SEL2, 1);
	set_outputs( inputs, nr_inputs , B) ;
	// convert to bin array for the simulation 
	decvalue2binar(A ,simulations_inputsA  ,nr_inputs );
	decvalue2binar(B ,simulations_inputsB  ,nr_inputs );
	// simulate 
	My_logic_function ( simulations_inputsA , simulations_inputsB ,nr_inputs, 
						simulations_outputsA, simulations_outputsB, nr_outputs  );
	// get the outputs of the circuit 
	get_led_status_bin( bin_outp_arry, 8 ); 
	// now we print all in a format so we can easy check it with the LED status 
	printf ("input A:%3d: ",A );
	print_bin_arry_status (simulations_inputsA , nr_inputs );
	printf (" B:%3d : ",B );
	print_bin_arry_status (simulations_inputsB , nr_inputs );
	printf("\n\routput : ");
	print_bin_arry_status (bin_outp_arry, nr_outputs);
	printf(" %3d", ar2decvalue(bin_outp_arry ,8 ),A+B);
	printf("\n\rsimout : ");
	print_bin_arry_status (simulations_outputsA, nr_outputs);
	printf(" %3d , %3d", ar2decvalue(simulations_outputsA ,8 ),A+B);
	printf("\n\r");
	//give some  time to check the LED's on the FPGA board 
	sleep(1);
		
		
	
	 gpioTerminate();
	return 0;  // will not be reached. 
}
