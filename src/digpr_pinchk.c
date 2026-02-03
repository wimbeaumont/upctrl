/*
 * Sample program for the practicum :  computer controlled experiments 
 * V1.x  based on wiringpi lib
 * V2.0   based on pigio lib 
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>


#include <pigpio.h>


#define LON   1   
#define LOFF  0   

/*
void   checkgroup ( int first , int last , int *pin ){
	for ( int lp=0 ; lp <4; lp++){
		for (int  i=first ; i <last+1; i++){  	gpioWrite (i ,LON);	}
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
*/	

int main (void)
{
  printf ("Raspberry Pi computer gecontroleerde meetopstellingen    V2.0 \r\n") ;
 printf( " debug status   ,use not connected to FPGA   \n\r");
  return 0 ;
  int err= gpioInitialise(); 
  //int err= init_cce_1();
  if (err < 0) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
  }
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
// GPIO [x] is located on pin yy 
PINGPIO[   0 ]= 27 ;	// special IO don't use 
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
PINGPIO[ 1   ]= 28 ;	// special IO don't use 
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
pin[0]=95;
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
	


int NrOfPins= sizeof(pin)/sizeof(pin[0]); 
   // check consistence array data
  for (int  i=0 ; i < NrOfPins ; i++)    {
    if (pin[i] < 30 ) {
        if ( i !=  PINGPIO[pin[i]] ) printf(" pin %d  ( GPIO ) %d gives  %d \n\r" , i, pin[i],PINGPIO[pin[i]] );
    }
  }
  
  
  for (int  i=0 ; i < NrOfPins ; i++) { if (pin[i] < 30 )   gpioSetMode( pin[i], PI_OUTPUT  ); }// set all to output
  for (int  i=0 ; i < NrOfPins; i++) {  if (pin[i] < 30 )   gpioWrite(pin[i] ,LOFF);  }  // make all off 
  for (int  i=1 ; i <NrOfPins; i++) {
	for (int  lc=0;lc <5; lc++) {
	  if ( pin[i]> 29) { printf ("pin %d,  value %d \n\r",i , pin[i]); }
	  else {	
		printf( " pin %d vmod %s  GPIO %d , lc %d ON  \n\r",i,gpiocon[pin[i]],pin[i],lc);
		gpioWrite(pin[i] ,LON);
		usleep(1000) ;	
		printf( " pin %d vmod %s  GPIO %d , lc %d OFF  \n\r",i,gpiocon[pin[i]],pin[i],lc);
		gpioWrite(pin[i] ,LOFF);
		usleep(1000) ;	
	  }
  	}
  }

  for (int  i=0 ; i < NrOfPins; i++) {  if (pin[i] < 30 ) gpioWrite(pin[i] ,LOFF);  }  // make all off 
  usleep(1000) ;
  for (int  i=0 ; i < NrOfPins; i++) {  if (pin[i] < 30 ) gpioWrite(pin[i] ,LON);  }  // make all on 
  usleep(1000) ;
   for (int  i=0 ; i < NrOfPins; i++) {  if (pin[i] < 30 ) gpioWrite(pin[i] ,LOFF);  }  // make all off 
  usleep(1000) ;
  
  // check first group 
/*  printf("first group  \n\r" );
  checkgroup ( 4 , 11, PINGPIO);
  printf("next group change switches \n\r" );
  usleep(1000) ;
  printf("started\n\r");
  checkgroup ( 12 ,19 ,PINGPIO);
  printf("next group change switches \n\r" );
  usleep(1000) ;
  printf("started\n\r");
  checkgroup ( 20 ,27,PINGPIO );
  printf("done !!\n\r");
 */  	
  gpioTerminate();	
  return 0 ;
}
