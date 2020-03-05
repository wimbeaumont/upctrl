#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o counterchkfpga2 counterchkfpga2.c -lpigpio -lpthread

program to readout the counters 

*/


int main(int argc, char *argv[])
{
	int counts[6];
   int ls[8];// read status 
   printf("start program %s\n\r", argv[0]);
  
	int err= init_cce_2();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}

 	gpioSetMode(clk3, PI_OUTPUT);
	gpioSetMode(14, PI_OUTPUT);
	const int start=clk3;
	const int datavalid = 14 ;
	setup_output_array( Dpins, 8); // to set the window counter no check for errors 
	
	set_muxout2( 0,8); // low byte 
	set_D_outputs( 8,2);
	gpioWrite (datavalid,1);
	gpioWrite (datavalid,0);
	set_muxout2( 1,8); // high  byte 
	set_D_outputs( 8,2);
	gpioWrite (datavalid,1);
	gpioWrite (datavalid,0);
	// check  Time low 
	set_muxout2( 7,8); // 
	get_led_status_bin(ls,8);
	printf("  LowByte Window timer is %d \n\r" ,  ar2decvalue(ls,8));
	 
	gpioSetMode(GPIO18,PI_OUTPUT);
	
	gpioWrite (GPIO18, 1) ;	 //clear counters 
	gpioWrite (GPIO18, 0) ;		
	
	set_muxout2( 6,8);
	gpioWrite(start,1); //activate the time window 
	gpioWrite(start,0);
	sleep(2);
	
	// read the counters 
	for (int  cnt=0;cnt < 6; cnt++){
		set_muxout2( cnt,8);
		printf( "cnt %d %d ,%d ,%d \n\r",cnt, gpioRead(MUXSEL2) ,	gpioRead(MUXSEL1) ,gpioRead(MUXSEL0) );
		get_led_status_bin(ls,8);
		counts[cnt]=  ar2decvalue(ls,8);
	}
	
	printf("%d %d count1= %d\n\r", counts[1], counts[0],counts[0]+256*counts[1]);
	printf("%d %d  count2= %d\n\r", counts[3], counts[2],counts[2]+256*counts[3]);
	printf("%d %d  count3= %d\n\r", counts[5], counts[4],counts[4]+256*counts[5]);	
	set_muxout2( 6,8);
   gpioTerminate();
}

