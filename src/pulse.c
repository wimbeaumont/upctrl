#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o dffchk dffchk.c -lpigpio -lpthread

*/



void  read_print_status(int *rp, int size) {
	int Pstat[size];
	for ( int lc=0 ; lc < size; lc++) {		
		Pstat[lc]=gpioRead(rp[lc]  ) ;		
		// outputs can be read back by the RP 
	}
	printf("current status : Qb:%1d Qa:%1d, D:%1d CE:%1d clk:%1d\n\r",Pstat[4],Pstat[3],Pstat[2],Pstat[1],Pstat[0] );
}

int main(int argc, char *argv[]) {

 
   printf("start program %s compiled at %s %s \n\r", argv[0],__DATE__ , __TIME__);
 
	int err= init_cce_1();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
    set_muxout( 'A' );  // set the routing of the signals on the FPGA board 
	// gpioSetMode(P7, PI_INPUT); // this is already done in init-cce_1
	// this is just to get LED1 off 
	gpioSetMode(D2, PI_OUTPUT);  // the D input 
	gpioWrite(D2,1);
	const unsigned CE= D5;  // this is the RP pin connected tot the CE of the FF 
	
	gpioSetMode(CE, PI_OUTPUT); 
	gpioSetMode(clk3, PI_OUTPUT); 
	gpioSetMode(D3, PI_OUTPUT);  // the D input 
	// rst is a push button 
	unsigned pr[5] ={ clk3 ,CE,D3, P3,P2 }; // array to read the status of inputs and outputs 
/*
	char  dummy[10];
	gpioWrite(CE,1); 
	gpioWrite(D3,0);
	gpioWrite(clk3,0);
	printf("push a and press enter after each question \n\r "); 
	read_print_status( pr, 5) ;
	printf( " push the rst button press enter when done  what you expect as outputs on the LED ( 2 and 3)  \n\r") ;
	scanf(" %s",dummy);
	read_print_status( pr, 5) ;
	printf( "CE is 1 and D3 is 0 \n\r"); 
	printf( "will set clk3 high  what you will expect to see on the LED's ?\n\r");	
	scanf(" %s",dummy);
	gpioWrite(clk3,1); read_print_status( pr, 5) ;
	printf( "will set D3  high  what you will expect to see on the LED's ?\n\r");
	scanf(" %s",dummy);
	gpioWrite(D3,1); read_print_status( pr, 5) ;
	printf( "will set clk3 low  what you will expect to see on the LED's ?\n\r");
	scanf(" %s",dummy);
	gpioWrite(clk3,0);read_print_status( pr, 5) ;
	printf( "will set clk3 high  what you will expect to see on the LED's ?\n\r");
	scanf(" %s",dummy);
	gpioWrite(clk3,1);read_print_status( pr, 5) ;
	printf( " push the rst button press enter when done  what you expect as outputs on the LED ( 2 and 3)  \n\r") ;
	scanf(" %s",dummy);
	int lc=0;
*/
	while(1) {
		//if( (lc++ % 10) == 0) { gpioWrite(D3, !gpioRead(P3)) ; }
		gpioWrite(clk3,0);
		//usleep( 200000);
		gpioWrite(clk3,1);
		//usleep( 200000);
		gpioWrite(clk3,0);
		//read_print_status( pr, 5) ;
		
	}


   gpioTerminate();
}

