/*
 * Sample program for the practicum :  computer controlled experiments 
 * 
 * Copyright (c) 2012-2013 Gordon Henderson. <projects@drogon.net>
 * Copyright (c) 2018  Wim Beaumont Universiteit Antwerpen
 ***********************************************************************
 * This file use wiringPi:
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
#include <wiringPi.h>
#include <string.h>

#define LON   1   
#define LOFF  0   


void   checkgroup ( int first , int last , int *pin ){
	for ( int lp=0 ; lp <4; lp++){
		for (int  i=first ; i <last+1; i++){  	digitalWrite (i ,LON);	}
		delay(1000);
		for (int  i=first ; i <last+1; i++){  digitalWrite (i ,LOFF);}
		delay(1000); 	
	}
	for (int  i=first ; i <last+1; i++){  
		digitalWrite (i ,LON);
		printf(" GPIO %d , pin %d on \n\r" ,i, pin[i]);
		delay(1000); 
		digitalWrite (i ,LOFF);
	}
}
	

int main (void)
{
  printf ("Raspberry Pi computer gecontroleerde meetopstellingen  practicum opdracht 2  V1.0 \r\n") ;
 
  wiringPiSetupGpio() ;

//vmod connector names "

char gpiocon[30][14];
for (int i=0 ;i < 30;i++) { strcpy(gpiocon[i],"---");};
strcpy(gpiocon[2],"SDA");
strcpy(gpiocon[3],"SCL");
strcpy(gpiocon[0],"'ID_SD");
strcpy(gpiocon[1],"ID_SC");


strcpy(gpiocon[26],"JA-D0_N P1");
strcpy(gpiocon[13],"JA-D0_P P2");
strcpy(gpiocon[5],"JA-D2_N P3");
strcpy(gpiocon[9],"JA-D2_P P4");


strcpy(gpiocon[19],"JA_CLK_N P7");
strcpy(gpiocon[6],"JA_CLK_P P8");
strcpy(gpiocon[11],"JA-D1_N P9");
strcpy(gpiocon[10],"JA-D1_P P10");



strcpy(gpiocon[22],"JB-D0_N P1");
strcpy(gpiocon[27],"JB-D0_P P2");
strcpy(gpiocon[17],"JB-D2_N P3");
strcpy(gpiocon[4],"JB-D2_P P4");









strcpy(gpiocon[21],"JC-D0_N P1");
strcpy(gpiocon[16],"JC-D0_P P2");
strcpy(gpiocon[7],"JC-D2_N P3");
strcpy(gpiocon[25],"JC-D2_P P4");


strcpy(gpiocon[20],"JC_CLK_N P7");
strcpy(gpiocon[12],"JC_CLK_P P8");
strcpy(gpiocon[8],"JC-D1_N P9");
strcpy(gpiocon[24],"JC-D1_P P10");




// gpio to pin conversion 

int PINGPIO[30];
PINGPIO[   0 ]= 27 ;	
PINGPIO[   2 ]=  3 ;	
PINGPIO[   3 ]=  5 ;	
PINGPIO[   4 ]=  7 ;	
PINGPIO[   5 ]= 29 ;	
PINGPIO[   6 ]= 31 ;	
PINGPIO[   9 ]= 21 ;	
PINGPIO[  10 ]= 19 ;	
PINGPIO[  11 ]= 23 ;	
PINGPIO[  13 ]= 33 ;	
PINGPIO[  17 ]= 11 ;	
PINGPIO[  19 ]= 35 ;	
PINGPIO[  22 ]= 15 ;	
PINGPIO[  26 ]= 37 ;	
PINGPIO[  27 ]= 13 ;	
PINGPIO[ 1   ]= 28 ;	
PINGPIO[ 12  ]= 32 ;	
PINGPIO[ 14  ]= 8  ;	
PINGPIO[ 15  ]= 10 ;	
PINGPIO[ 16  ]= 36 ;	
PINGPIO[ 18  ]= 12 ;	
PINGPIO[ 20  ]= 38 ;	
PINGPIO[ 21  ]= 40 ;	
PINGPIO[ 23  ]= 16 ;	
PINGPIO[ 24  ]= 18 ;	
PINGPIO[ 25  ]= 22 ;	
PINGPIO[ 7   ]= 26 ;	
PINGPIO[ 8   ]= 24 ;	



// pin to gpio conversion 
int pin[41]; // keep it simple pin 0 doesn't exist .. 
pin[1]=98;
pin[  3 ]=   2 ;
pin[  5 ]=   3 ;
pin[  7 ]=   4 ;
pin[  9 ]=99;
pin[ 11 ]=  17 ;
pin[ 13 ]=  27 ;
pin[ 15 ]=  22 ;
pin[ 17 ]=98;
pin[ 19 ]=  10 ;
pin[ 21 ]=   9 ;
pin[ 23 ]=  11 ;
pin[ 25 ]=99;
pin[ 27 ]=   0 ;
pin[ 29 ]=   5 ;
pin[ 31 ]=   6 ;
pin[ 33 ]=  13 ;
pin[ 35 ]=  19 ;
pin[ 37 ]=  26 ;
pin[ 39 ]=99;
pin[ 2  ]=97;
pin[ 4  ]=97;
pin[ 6  ]=99;
pin[ 8  ]= 14  ;
pin[ 10 ]= 15  ;
pin[ 12 ]= 18  ;
pin[ 14 ]=99;
pin[ 16 ]= 23  ;
pin[ 18 ]= 24  ;
pin[ 20 ]=99;
pin[ 22 ]= 25  ;
pin[ 24 ]= 8   ;
pin[ 26 ]= 7   ;
pin[ 28 ]= 1   ;
pin[ 30 ]=99;
pin[ 32 ]= 12  ;
pin[ 34 ]=99;
pin[ 36 ]= 16  ;
pin[ 38 ]= 20  ;
pin[ 40 ]= 21  ;
	



  for (int  i=0 ; i <28; i++) {  pinMode (i, OUTPUT) ; } // set all to output
  for (int  i=4 ; i <28; i++) { digitalWrite (i ,LOFF);  }  // make all off 
  /*for (int  i=1 ; i <41; i++) {
	for (int  lc=0;lc <5; lc++) {
	  if ( pin[i]> 29) { printf ("pin %d,  value %d \n\r",i , pin[i]); }
	  else {	
		printf( " pin %d vmod %s  GPIO %d , lc %d ON  \n\r",i,gpiocon[pin[i]],pin[i],lc);
		digitalWrite (pin[i] ,LON);
		delay(1000) ;	
		printf( " pin %d vmod %s  GPIO %d , lc %d OFF  \n\r",i,gpiocon[pin[i]],pin[i],lc);
		digitalWrite (pin[i] ,LOFF);
		delay(1000) ;	
	  }
  	}
  }
*/
  for (int  i=4 ; i <28; i++) { digitalWrite (i ,LOFF);  }  // make all off 
  delay(1000) ;
  for (int  i=4 ; i <28; i++) { digitalWrite (i ,LON);  }  // make all off 
  delay(1000) ;	
  for (int  i=4 ; i <28; i++) { digitalWrite (i ,LOFF);  }  // make all off 
  delay(1000) ;
  // check first group 
  printf("first group  \n\r" );
  checkgroup ( 4 , 11, PINGPIO);
  printf("next group change switches \n\r" );
  delay(1000) ;
  printf("started\n\r");
  checkgroup ( 12 ,19 ,PINGPIO);
  printf("next group change switches \n\r" );
  delay(1000) ;
  printf("started\n\r");
  checkgroup ( 20 ,27,PINGPIO );
  printf("done !!\n\r");
   	
	
  return 0 ;
}
