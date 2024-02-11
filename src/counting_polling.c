#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 


/*

gcc -o counting_polling counting_polling.c -lpigpio -lpthread

*/


int main(int argc, char *argv[]){
	

	int ls[8];// read status led status
   
	int clkdiv=200;
    if ( argc > 1) {
			clkdiv= atoi(argv[1]);
			if( clkdiv < 1 || clkdiv >256 ) clkdiv=200;
	}
	printf("start program with %s clkdiv %d\n\r", argv[0], clkdiv);
	int err= init_cce_2();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
    set_muxout2( 6,8); 
	err=setup_output_array( Dpins, 8 );
	if (err) {
		printf("initialization of  D's  failed with err %d \n\r", err);
		return err; 
	}
	set_outputs(Dpins,8,clkdiv); // set dividing value 
	err=gpioSetMode (GPIO15, PI_OUTPUT );
	gpioWrite (GPIO15, 1) ;	//enable writing register
	gpioWrite (GPIO15, 0) ;	// disabe writing register
	/* 
	int Dstat[8];
	get_inp_status_bin(Dstat,Dpins,8);
	print_bin_arry_status (Dstat,8);printf("\n\r");
	*/
	long lcnt=0;
	int counter[3]= {0,0,0 };
	int onedet[3]= {0,0,0 }; 
	
	int coinc=0; int c_onedet=0;
	int andcnt=0;
	while ( lcnt++ < (long)3*10e6 ) {
			get_led_status_bin( ls, 3); // led status == P
			for ( int lc=0; lc <3 ;lc++){ // there are pulse inputs 
				if ( ls[lc]  ) {
						if ( onedet[lc ] == 0 ){
							 onedet[lc ]=1;
							 counter[lc]++;
						};  //else nothing to do 
				} else {  //back to zero or still zero
					onedet[lc ]=0;
				}
			}	
			coinc = ls[0] && ls[1];
			if ( coinc ) {
				if ( c_onedet ==0 ) {
				 c_onedet=1;
				 andcnt++;
				}
			}else{  c_onedet=0;	
			}
			//for ( int lc=0; lc <3 ;lc++){printf ( "cnt %d =  %d " , lc, counter[lc]);}
			//printf(" andcnt %d \n\r",andcnt);
	}

	for ( int lc=0; lc <3 ;lc++){ printf ( "cnt %d =  %d " , lc, counter[lc]); }
	printf(" andcnt = %d \n\r",andcnt);
   gpioTerminate();
   return 0;
}

