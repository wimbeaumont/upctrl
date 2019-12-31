#ifndef __CCE_1_DEF_H
#define __CCE_1_DEF_H

#include <pigpio.h>

// pin defs 20191213 
//copied from the iotable editing will be lost 


const int D1=26;
const int D0=13;
const int D7=5;
const int D6=9;


const int D2=19;
const int D3=6;
const int D4=11;
const int D5=10;

const int clk3=23;

const int LEDgreen=18;



const int MUXSEL0=17;
const int MUXSEL1=4;



const int SEL=22;






const int P0=21;
const int P1=16;
const int P2=7;
const int P3=25;


const int P4=20;
const int P5=12;
const int P6=8;
const int P7=24;


//  end pin def 

typedef struct iopin_struct  {
	unsigned  pin ;
	unsigned mode ;
	unsigned initialized;

} iopin ;

int init_pin( iopin *thispin ) {
	int err = gpioSetMode( thispin->pin, thispin->mode );
	if ( err ) {	
		thispin->initialized=0; 
		printf("can not set pin %d in mode %d err: %d \n\r",thispin->pin,thispin->mode ,err ); 
	}
	else thispin->initialized=1;
	return err; 
}	

int init_pin2( iopin *thispin, unsigned pin, unsigned mode  ) {
	thispin->pin=pin;
     thispin->mode=mode;
	 
	return init_pin(thispin); 
}	


typedef struct cce_1pins_struct {
	iopin mux_out_s0;
	iopin mux_out_s1;
	iopin led[8];
} cce_1pins;


cce_1pins iopins;

int init_cce_1() {
	
	int err= gpioInitialise();
	if (err <0) return err;
	err = init_pin2( &iopins.mux_out_s0,MUXSEL0,PI_OUTPUT ) ;
	if (err <0) return err; 	
	err = init_pin2( &iopins.mux_out_s1,MUXSEL1,PI_OUTPUT ) ;
	if (err <0) return err;
    unsigned ledpinnr[8] ={ P0 ,P1,P2 ,P3,P4,P5,P6,P7 };
	for ( int cnt=0 ; cnt<8 ; cnt++) {
		err = init_pin2( &iopins.led[cnt],ledpinnr[cnt],PI_INPUT ) ;
		if (err <0) return err; 	
	}
	 
	return err; 
}

				
		
int get_led_status_bin( unsigned* ls, int size ){
	for ( int cnt=0 ; cnt<size  ; cnt++) {
		*ls++ = gpioRead( iopins.led[cnt].pin); 

	}
}

// reads the pins that are called led 0 .. 4 and print the  satatus if print > 0 
int print_led_status (int print) {
	// no check if it is initialized for the moment 
	unsigned ls[8] ;
	get_led_status_bin( ls, 8 ); 
	if( print > 0) {  print_bin_arry_status (ls, sizeof(ls)/sizeof(ls[0]));}
	if( print > 1) { printf ( "\n\r" );}
	return ar2decvalue(ls, sizeof(ls)/sizeof(ls[0]));
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




	
int set_muxout( char  a ) {
	int err=0; 
	//printf( "init status s0  %d , s2  %d \n\r", iopins.mux_out_s0.initialized ,  iopins.mux_out_s1.initialized);
	if (iopins.mux_out_s0.initialized &&  iopins.mux_out_s1.initialized ){
		switch ( a ) { 
			case 'A'  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,0);				
			}			
			break;			
			case 'B'  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,0);
			}
			break;	
			case 'C'  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,1);
			}
			break;	
			case 'D'  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,1);
			}
			break;	
			default :  err =-2 ;
		}
	}	
	else { err =-1; }
	return err;
}

#endif 