#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
//#include <ncurses.h>

#include <pigpio.h>

/*
freq_count_1.c
2014-08-21
Public Domain

$ gcc -o rbpi_and_2a rbpi_and2a.c -lpigpio -lpthread
$ sudo ./rbpi_and_2a


*/


#define MAX_GPIOS 32



int main(int argc, char *argv[])       //argc is the number of arguments (default is 1, the name of the program), argv is an array containing the arguments
{

   /* command line parameters */

// storage for read from the input.   
char  dummyc[10];
 
// global initialization  ( activate some lib functions) 
   if (gpioInitialise()<0) return 1;
   
// these are needed to  set some signal routing correct. (setting up multiplexers ) 
// you can ignore for the moment 
// set MUX_OUT  to A input  
   gpioSetMode(17, PI_OUTPUT); // Set GPIO17 as output.(MUXSEL0)
   gpioSetMode(4, PI_OUTPUT); // Set GPIO4 as output.( MUXSEL1)
   gpioWrite (17, 0) ;gpioWrite (4, 0) ; //Set mux 
   
//     
//  alias,  to have the names in the schematic the same as in the program 
#define P0 21   // the output P0  is effectively connected to raspberry GPIO 21  
#define P1 16   // the output P1  is effectively connected to raspberry GPIO 16   
#define P2  7   // the output P2  is effectively connected to raspberry GPIO 21  
#define P3 15   // the output P3  is effectively connected to raspberry GPIO 15  
// the output ports of the FPGA have to be read by the PI  so in the program
// these should be defined as input ports. 
   gpioSetMode(P0, PI_INPUT);
   gpioSetMode(P1, PI_INPUT);
   gpioSetMode(P2, PI_INPUT);
   gpioSetMode(P3, PI_INPUT);

#define GPIO13 13  // D0 in schematic 
#define GPIO26 26  // D1 in schematic
#define GPIO19 19  // D2 in schematci 

// these drive the inputs of the FPGA so have to defined as outputs 
   gpioSetMode(GPIO13, PI_OUTPUT);
   gpioSetMode(GPIO26, PI_OUTPUT);
   gpioSetMode(GPIO19, PI_OUTPUT);   



printf("| |-----GPIO------|   |\n\r");
printf("|x| 19| 26| 13| P1| P0|\n\r");
gpioWrite (GPIO19, 0);gpioWrite (GPIO26, 0) ;gpioWrite (GPIO13, 0);
printf("|0| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);
gpioWrite (GPIO19, 0);gpioWrite (GPIO26, 0) ;gpioWrite (GPIO13, 1);
printf("|1| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);
gpioWrite (GPIO19, 0);gpioWrite (GPIO26, 1) ;gpioWrite (GPIO13, 0);
printf("|2| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);
gpioWrite (GPIO19, 0);gpioWrite (GPIO26, 1) ;gpioWrite (GPIO13, 1);
printf("|3| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);
gpioWrite (GPIO19, 1);gpioWrite (GPIO26, 0) ;gpioWrite (GPIO13, 0);
printf("|4| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);
gpioWrite (GPIO19, 1);gpioWrite (GPIO26, 0) ;gpioWrite (GPIO13, 1);
printf("|5| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);
gpioWrite (GPIO19, 1);gpioWrite (GPIO26, 1) ;gpioWrite (GPIO13, 0);
printf("|6| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);
gpioWrite (GPIO19, 1);gpioWrite (GPIO26, 1) ;gpioWrite (GPIO13, 1);
printf("|7| %d | %d | %d | %d | %d |\n\r",gpioRead(GPIO19),gpioRead(GPIO26),gpioRead(GPIO13),gpioRead(P1),gpioRead(P0));
sleep(1);




   gpioTerminate();
}

