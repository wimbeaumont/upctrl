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

const int SEL0=17;
const int SEL1=4;


const int SEL2=22;
const int clk1=27;






const int P0=21;
const int P1=16;
const int P2=7;
const int P3=25;


const int P4=20;
const int P5=12;
const int P6=8;
const int P7=24;

const int MUXSEL2 = 22;// use GPIO 22 for 8 input mux
const int GPIO15=15;
const int GPIO14=14;
const int GPIO18=18;
//  end automatic pin def 

//extra pin def
const int GPIO22=22;

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
	iopin mux_out_s2;
	iopin led[8];
} cce_1pins;


cce_1pins iopins;

int init_cce_1() {
	
	int err= gpioInitialise();
	if (err <0) return err;
	err = init_pin2( &iopins.mux_out_s0,SEL0,PI_OUTPUT ) ;
	if (err <0) return err; 	
	err = init_pin2( &iopins.mux_out_s1,SEL1,PI_OUTPUT ) ;
	if (err <0) return err;
    unsigned ledpinnr[8] ={ P0 ,P1,P2 ,P3,P4,P5,P6,P7 };
	for ( int cnt=0 ; cnt<8 ; cnt++) {
		err = init_pin2( &iopins.led[cnt],ledpinnr[cnt],PI_INPUT ) ;
		if (err <0) return err; 	
	}
	 
	return err; 
}


int init_cce_2() {
	// do all init as for pr1  + 
	int err= init_cce_1();
	if (err <0) return err;
	err = init_pin2( &iopins.mux_out_s2,SEL2,PI_OUTPUT ) ;
	if (err <0) return err;
	return err;
}
				
		
void  get_led_status_bin( unsigned* ls, int size ){
	for ( int cnt=0 ; cnt<size  ; cnt++) {
		*ls++ = gpioRead( iopins.led[cnt].pin); 

	}
}

// read back the input of a pin array, result is stored in stat 
void get_inp_status_bin( unsigned *stat, int *pinno, int size ) {
	for ( int cnt=0 ; cnt<size  ; cnt++) {
		*stat++ = gpioRead( pinno[cnt]); 
	}
}

// reads the pins that are called led 0 .. 7 and print the  satatus if print > 0 
int print_led_status (int print) {
	// no check if it is initialized for the moment 
	unsigned ls[8] ;
	get_led_status_bin( ls, 8 ); 
	if( print > 0) {  print_bin_arry_status ((int*)ls, sizeof(ls)/sizeof(ls[0]));}
	if( print > 1) { printf ( "\n\r" );}
	return ar2decvalue((int*)ls, sizeof(ls)/sizeof(ls[0]));
}


// standard input for FPGA 
int  Dpins[] = {  13, 26,19,6,11,10,9,5 };
//int  Dpins[] = { D0, D1,D2,D3,D4,D5,D6,D7  };  // compiler error

iopin Ds[8]; 
// function to initiate  a array of outputs  ( inputs for the FPGA) 
int setup_output_array( int* pinarry , int size ) {
	int err=0;
	if ( size > 8 ) { err=-20; }
	else {
		for ( int c =0 ; c <  size ; c++) {
			init_pin2( &Ds[c], pinarry[c], PI_OUTPUT  );
			err= init_pin(&Ds[c]) ;
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


void set_D_outputs( const int nrpins, int value) {
		unsigned pinnr[nrpins];
		for ( int pcnt=0;pcnt < nrpins; pcnt++ ) {
				pinnr[pcnt]=Ds[pcnt].pin;
		}
		set_outputs( pinnr , nrpins, value);
}

// set a number of outputs depending on the array  value ( each element is a bit , 0 = 0 else 1 
void set_outputsB( unsigned pins[], const int nrpins , int value[] ){
		for (int pincnt=0; pincnt < nrpins; pincnt++) {
				int bitvalue=0;
				if ( value[pincnt] > 0) bitvalue=1;
				gpioWrite( pins[pincnt], bitvalue );
		}
}

void set_D_outputsB( const int nrpins, int value[] ) {
		unsigned pinnr[nrpins];
		for ( int pcnt=0;pcnt < nrpins; pcnt++ ) {
				pinnr[pcnt]=Ds[pcnt].pin;
		}
		set_outputsB( pinnr , nrpins, value);
}


int set_muxout2( int a, int nrinp ) {
	int err=0; 
	//printf( "init status s0  %d , s2  %d \n\r", iopins.mux_out_s0.initialized ,  iopins.mux_out_s1.initialized);
	if (iopins.mux_out_s0.initialized &&  iopins.mux_out_s1.initialized ){
	 if (nrinp ==4 ) {	
		switch ( a ) { 
			case 0  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,0);				
			}			
			break;			
			case 1  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,0);
			}
			break;	
			case 2  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,1);
			}
			break;	
			case 3  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,1);
			}
			break;	
			default :  err =-3 ;
		}// end switch
	 }else 
      if( nrinp==8) {
		  switch ( a ) {
			case 0  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,0);
				gpioWrite(iopins.mux_out_s2.pin,0);					
			}			
			break;			
			case 1  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,0);
				gpioWrite(iopins.mux_out_s2.pin,0);				
			}
			break;	
			case 2  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,1);
				gpioWrite(iopins.mux_out_s2.pin,0);		
			}
			break;	
			case 3  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,1);
				gpioWrite(iopins.mux_out_s2.pin,0);
			}
			break;
			case 4  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,0);
				gpioWrite(iopins.mux_out_s2.pin,1);								
			}			
			break;			
			case 5  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,0);
				gpioWrite(iopins.mux_out_s2.pin,1);
			}
			break;	
			case 6  : { 
				gpioWrite(iopins.mux_out_s0.pin,0);
				gpioWrite(iopins.mux_out_s1.pin,1);
				gpioWrite(iopins.mux_out_s2.pin,1);
			}
			break;	
			case 7  : { 
				gpioWrite(iopins.mux_out_s0.pin,1);
				gpioWrite(iopins.mux_out_s1.pin,1);
				gpioWrite(iopins.mux_out_s2.pin,1);
			}
			default :  err =-2 ;
		 }	// end switch
	  }else  { err = -2; }
	  //printf( "a   %d %d ,%d ,%d \n\r ",a, gpioRead(iopins.mux_out_s2.pin) ,	gpioRead(iopins.mux_out_s1.pin) ,gpioRead(iopins.mux_out_s0.pin) );
	 } else { err =-1; }  //end if initialized 
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
