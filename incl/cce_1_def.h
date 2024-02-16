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



#endif 
