#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 
#include "upctrl_pinfunctions.h" 

/*

gcc -o counterchk4 counterchk4.c -lpigpio -lpthread

program to readout the counters 

*/


int main(int argc, char *argv[])
{
	int err= init_cce_2();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
	// redifine pins 
	int RSTcnt=GPIO15;
	int RegDataValid = GPIO14;
	int bytesel0 = SEL2; // select byte in output mux 
	int bytesel1 = clk1;
	//gpioSetMode(bytesel0,PI_OUTPUT); already done
	gpioSetMode(bytesel1,PI_OUTPUT);
	gpioSetMode(RegDataValid,PI_OUTPUT);
	gpioSetMode(RSTcnt,PI_OUTPUT); // reset counters
	setup_output_array( Dpins,8);
   int counts[6];
   int ls[8];// read status 
   printf("start program %s\n\r", argv[0]);
  
	gpioWrite (bytesel0, 0) ;	gpioWrite (bytesel1, 0);
    
    // reg sel for settings 
    gpioWrite ( SEL1, 1); gpioWrite ( SEL0, 0); 
    // D0 =  Coincedence = AND at  input ,  D1,D2 1,1 input sel ext  ,  D3 =1 disable window timing 
    int settings[8] = { 0,1,1,1,0,0,0,0};
    set_D_outputsB ( 8, settings);
    gpioWrite (RegDataValid, 1);gpioWrite (RegDataValid, 0);// write to reg 
    
    //start 
	gpioWrite (RSTcnt, 1) ;	gpioWrite (RSTcnt, 0) ; //reset 
	set_muxout2( 3,0); 		
	// start (enable counters) 
	gpioWrite (D2, 1) ;		
	
	for (int lc=0 ;lc < 4000; lc++) {	
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
	//sleep(1);
	gpioWrite (D2, 0) ;	
		
	// read the counters 
	for (int  cnt=0;cnt < 3; cnt++){
		set_muxout2( cnt,4); 
		//printf( "cnt %d %d ,%d ,%d ",cnt, gpioRead(MUXSEL2) ,	gpioRead(MUXSEL1) ,gpioRead(MUXSEL0) );
		gpioWrite (bytesel0, 0) ;	gpioWrite (bytesel1, 0) ;	
		get_led_status_bin(ls,8);
		counts[2*cnt]=  ar2decvalue(ls,8);
		//printf(" count[%1d]: %d \n\r", 2*cnt, counts[2*cnt]);
		gpioWrite (bytesel0, 1) ;	gpioWrite (bytesel1, 0) ;	
		get_led_status_bin(ls,8);
		counts[2*cnt+1]=  ar2decvalue(ls,8);
		//printf(" count[%1d]: %d \n\r", 2*cnt+1, counts[2*cnt+1]);
	}
	
	printf("%d %d count1= %d\n\r", counts[1], counts[0],counts[0]+256*counts[1]);
	printf("%d %d  count2= %d\n\r", counts[3], counts[2],counts[2]+256*counts[3]);
	printf("%d %d  count3= %d\n\r", counts[5], counts[4],counts[4]+256*counts[5]);	
	gpioWrite (bytesel0, 0) ;	gpioWrite (bytesel1, 0) ;	
	set_muxout2( 0,4);
   gpioTerminate();
}

