#ifndef UPCTRL_PINFUNCTIONS
#define UPCTRL_PINFUNCTIONS

#include "cce_1_def.h" 

int init_cce_1() {
	
	int err= gpioInitialise();
	if (err <0) return err;
	err = gpioSetMode( SEL0, PI_OUTPUT  );
	if (err <0) return err; 
	err = gpioSetMode( SEL1, PI_OUTPUT  );
	if (err <0) return err;
	for ( int cnt=0 ; cnt<8 ; cnt++) {
		err = gpioSetMode( ledpinnr[cnt], PI_INPUT  );
		if (err <0) return err; 	
	}
	return err; 
}

int init_cce_2() {
	// do all init as for pr1+SEL2 
	int err= init_cce_1();
	if (err <0) return err;
	err = gpioSetMode( SEL2, PI_OUTPUT  );
	if (err <0) return err;
	return err;
}

void  get_led_status_bin( unsigned* ls, int size ){
	for ( int cnt=0 ; cnt<size  ; cnt++) {
		*ls++ = gpioRead( ledpinnr[cnt]); 
	}
}

// read back the input of a pin array, result is stored in stat 
void get_inp_status_bin( unsigned *stat, int *pinno, int size ) {
	for ( int cnt=0 ; cnt<size  ; cnt++) {
		*stat++ = gpioRead( pinno[cnt]); 
	}
}

// reads the pins that are called led 0 .. 7 and print the  satatus if print > 0 
// no check if it is initialized for the moment 
int print_led_status (int print) {
	
	unsigned ls[8] ;
	get_led_status_bin( ls, 8 ); 
	if( print > 0) {  print_bin_arry_status ((int*)ls, sizeof(ls)/sizeof(ls[0]));}
	if( print > 1) { printf ( "\n\r" );}
	return ar2decvalue((int*)ls, sizeof(ls)/sizeof(ls[0]));
}

//iopin Ds[8]; 
// function to initiate  a array of outputs  ( inputs for the FPGA) 
int setup_output_array( int* pinarry , int size ) {
	int err=0;
	if ( size > 8 ) { err=-20; }
	else {
		for ( int c =0 ; c <  size ; c++) {
			err = gpioSetMode( pinarry[c], PI_OUTPUT  );
			if ( err) break;
		}
	}
	return err;
}

/* function to set a number of output
	pins :  array of  pin numbers  of the io's  to be set  
	nrpins : nr pins to be set ( should be equal as the  size of the pins array )
	value : the decimal value to be set  rolls over at 2 to the power nr_pins
*/ 

void set_outputs( unsigned pins[], const int nrpins , int value ){
		int value_array[nrpins];
		decvalue2binar(value , value_array , nrpins) ;
		for (int pincnt=0; pincnt < nrpins; pincnt++) {
				gpioWrite( pins[pincnt], value_array[pincnt]);
		}
	
}

// set a number of outputs depending on the array  value ( each element is a bit , 0 = 0 else 1 
void set_outputsB( unsigned pins[], const int nrpins , int value[] ){
		for (int pincnt=0; pincnt < nrpins; pincnt++) {
				int bitvalue=0;
				if ( value[pincnt] > 0) bitvalue=1;
				gpioWrite( pins[pincnt], bitvalue );
		}
}

int set_muxout2( int a, int nrinp ) {
	int err=0; 
	if (nrinp ==4 ) {	
		switch ( a ) { 
			case 0  : { 
				gpioWrite(SEL0,0);
				gpioWrite(SEL1,0);				
			}			
			break;			
			case 1  : { 
				gpioWrite(SEL0,1);
				gpioWrite(SEL1,0);
			}
			break;	
			case 2  : { 
				gpioWrite(SEL0,0);
				gpioWrite(SEL1,1);
			}
			break;	
			case 3  : { 
				gpioWrite(SEL0,1);
				gpioWrite(SEL1,1);
			}
			break;	
			default :  err =-3 ;
		}// end switch
	 }else 
      if( nrinp==8) {
		  switch ( a ) {
			case 0  : { 
				gpioWrite(SEL0,0);
				gpioWrite(SEL1,0);
				gpioWrite(SEL2,0);
			}			
			break;			
			case 1  : { 
				gpioWrite(SEL0,1);
				gpioWrite(SEL1,0);
				gpioWrite(SEL2,0);
			}
			break;	
			case 2  : { 
				gpioWrite(SEL0,0);
				gpioWrite(SEL1,1);
				gpioWrite(SEL2,0);
			}
			break;	
			case 3  : { 
				gpioWrite(SEL0,1);
				gpioWrite(SEL1,1);
				gpioWrite(SEL2,0);
			}
			break;
			case 4  : { 
				gpioWrite(SEL0,0);
				gpioWrite(SEL1,0);
				gpioWrite(SEL2,1);
			}			
			break;			
			case 5  : { 
				gpioWrite(SEL0,1);
				gpioWrite(SEL1,0);
				gpioWrite(SEL2,1);
			}
			break;	
			case 6  : { 
				gpioWrite(SEL0,0);
				gpioWrite(SEL1,1);
				gpioWrite(SEL2,1);
			}
			break;	
			case 7  : { 
				gpioWrite(SEL0,1);
				gpioWrite(SEL1,1);
				gpioWrite(SEL2,1);
			}
			default :  err =-2 ;
		 }	// end switch
	  }else  { err = -2; }
	return err;
}

int set_muxout( char a  ) {
		int err=0,inpnr=0;
		switch ( a ) { 
			case 'A'  : { inpnr=0; }
			break;
			case 'B'  : { inpnr=1; }
			break;
			case 'C'  : { inpnr=2; }
			break;
			case 'D'  : { inpnr=3; }
			break;
			default :  err =-3 ;
		}
		if ( err == 0) {
			err=set_muxout2( inpnr, 4) ;
		}
		return err;
}
#endif  
//UPCTRL_PINFUNCTIONS
