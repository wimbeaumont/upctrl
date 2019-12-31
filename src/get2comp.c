#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>

#include "pr_utils.h" 

/*
		gcc -o get2comp get2comp.c 
	
*/
int My_logic_function ( int* inp , int insize, int*  outp, int outsize  ) {
	
	
	for ( int inpcnt=0; inpcnt < insize ; inpcnt++) {
			outp[inpcnt] = inp[inpcnt] & 1;
	}
	inv_bin_array(outp, outsize  );
	
	return 0;
} 

	


int main(int argc, char *argv[]){
   

	const int nr_inputs=8;
	const int nr_outputs=nr_inputs;
// -- here start the test 	
	int nr_inpcomb=1; nr_inpcomb= nr_inpcomb<<nr_inputs ;  // power of 2 
	int bin_outp_arry[nr_outputs];
	int simulations_inputsA[nr_inputs];
	int simulations_outputs[nr_outputs];
	// itterate  over all combinations 
    for (int  inpcomb=0 ; inpcomb < nr_inpcomb ; inpcomb++) {
		int A= inpcomb & 0xFF;
		// convert to bin array for the simulation 
		decvalue2binar(A ,simulations_inputsA  ,nr_inputs );
		
		// simulate 
		My_logic_function ( simulations_inputsA ,nr_inputs, simulations_outputs, nr_outputs  );
		// get the outputs of the circuit 
		printf ("input A: " );
		print_bin_arry_status (simulations_inputsA , nr_inputs );
		printf("\n\rsimout : ");
		print_bin_arry_status (simulations_outputs, nr_outputs);
		printf(" %3d" , ar2decvalue(simulations_outputs ,8 ));
		printf("\n\r");
		//give some  time to check the LED's on the FPGA board 
		sleep(2);
		
		
	}
	return 0;  // will not be reached. 
}