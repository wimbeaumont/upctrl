#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>

#include <pigpio.h>

/*

2014-08-21
Public Domain

gcc -o rbpi_readio rbpi_readio.c -lpigpio -lpthread
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

#define	SWITCH 	3


int main(int argc, char *argv[])
{
int SwStatus;
   /* command line parameters */

  

   printf("Monitoring gpios");
 

   if (gpioInitialise()<0) return 1;
	gpioSetMode(SWITCH, PI_INPUT); // Set GPIO as input.
	
for (;;)
  {
    SwStatus =gpioRead (SWITCH ) ;
	printf("Switch status = %d \n\r",SwStatus);
    sleep (1) ;		// mS
  }


   gpioTerminate();
}

