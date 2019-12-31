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

gcc -o rbpi_toglleall rbpi_toglleall.c -lpigpio -lpthread
$ sudo ./freq_count_1  4 7 8


*/


#define MAX_GPIOS 32


void usage()
{
   fprintf
   (stderr,
      "\n" \
      "Usage: sudo ./freq_count_1 gpio ... [OPTION] ...\n"
	);
}

void fatal(int show_usage, char *fmt, ...)
{
   char buf[128];
   va_list ap;

   va_start(ap, fmt);
   vsnprintf(buf, sizeof(buf), fmt, ap);
   va_end(ap);

   fprintf(stderr, "%s\n", buf);

   if (show_usage) usage();

   fflush(stderr);

   exit(EXIT_FAILURE);
}




int main(int argc, char *argv[])
{

   /* command line parameters */

  
int pin;
int newpin;
char c;

 

   if (gpioInitialise()<0) return 1;
   for(  pin=2 ; pin <= 27; pin++) 	gpioSetMode(pin, PI_OUTPUT); // Set GPIO18 as output.
   for(  pin=2 ; pin <= 27; pin++) 	gpioWrite (pin, 0) ; // Set GPIO to 0 
	pin=2;
for (;;)  {
	c=getchar();
	if ( c=='-') pin-- ;
	if ( c=='+') pin++ ;
	if ( c=='q') break ;
	if( pin < 2) pin=27;
	if( pin > 27) pin=2;
	

			gpioWrite (pin, 1) ;	// On
			printf("set gpio%d to on \n\r",pin);
			sleep (2) ;		// mS
			gpioWrite (pin, 0) ;	// Off
			printf("set gpio%d to off \n\r",pin);
			sleep (2) ;
	
}

for(  pin=2 ; pin <= 27; pin++) 	{
	for( int cnt=0 ; cnt <2;cnt++) {
		gpioWrite (pin, 1) ;	// On
		printf("set gpio%d to on \n\r",pin);
		sleep (1) ;		// mS
		gpioWrite (pin, 0) ;	// Off
		printf("set gpio%d to off \n\r",pin);
		sleep (1) ;
	}
}
	


   gpioTerminate();
}

