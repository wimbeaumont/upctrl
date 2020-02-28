/*
 * This program is based on isr.c adapted for the EDF practical class 
 *
 *
 * Copyright (c) 2013 Gordon Henderson.
 ***********************************************************************
 * This file is part of wiringPi:
 *	https://projects.drogon.net/raspberry-pi/wiringpi/
 *
 *    wiringPi is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    wiringPi is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
 ***********************************************************************
 */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <stdarg.h>
#include <unistd.h>
#include "pr_utils.h" 
#include "cce_1_def.h" 
#include <wiringPi.h>  // for the interrupt routines 
// globalCounter:
//	Global variable to count interrupts
//	Should be declared volatile to make sure the compiler doesn't cache it.

static volatile int globalCounter [3] ;

/*
 * myInterrupt:
 *********************************************************************************
 */

void myInterrupt0 (void) { ++globalCounter [0] ; }
void myInterrupt1 (void) { ++globalCounter [1] ; }
void myInterrupt2 (void) { ++globalCounter [2] ; }


/*
 *********************************************************************************
 * main
 *********************************************************************************
 */

int main(int argc, char *argv[]){
	printf("doesn't work as wiringPI use other pin assignment\n\r");
	exit(-1);
	int gotOne, pin ;
	int myCounter [8] ;
	int ls[8];// read status led status
   
	int clkdiv=200;
    if ( argc > 1) {
			clkdiv= atoi(argv[1]);
			if( clkdiv < 1 || clkdiv >256 ) clkdiv=200;
	}
	printf("start program with %s clkdiv %d\n\r", argv[0], clkdiv);
	if (wiringPiSetup () < 0)
  {
    fprintf (stderr, "Unable to setup wiringPi: errno : %d\n", errno) ;
    return 1 ;
  }

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
	// activate the interrups 
	wiringPiISR (P0, INT_EDGE_RISING, &myInterrupt0) ;
	wiringPiISR (P1, INT_EDGE_RISING, &myInterrupt1) ;
	wiringPiISR (P2, INT_EDGE_RISING, &myInterrupt2) ;
  
    gotOne = 0 ;
    printf ("Waiting ... ") ; fflush (stdout) ;
	sleep(2);
	//deactivate interrupts 
	
	wiringPiISR (P0, INT_EDGE_RISING, 0) ;
	wiringPiISR (P1, INT_EDGE_RISING, 0) ;
	wiringPiISR (P2, INT_EDGE_RISING, 0) ;
  
	printf( "counters : %d  %d %d \n\r", globalCounter[0], globalCounter[1],globalCounter[2]);
	//deactivate interrupts 
	
	
	gpioTerminate();
  return 0 ;
}
