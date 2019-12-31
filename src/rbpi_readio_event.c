#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>

#include <pigpio.h>

/*
freq_count_1.c
2014-08-21
Public Domain

gcc -o rbpi_readio_event rbpi_readio_event.c -lpigpio -lpthread
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
#define	LED	2
#define	SWITCH 	3
int intrlvl=0;
void isr(int gpio, int level, uint32_t tick) {
  printf("isr - gpio: %d, level: %d  thick %d  %d\n", gpio, level,tick);
  intrlvl=level;
}


int main(int argc, char *argv[])
{
int WaitCnt=0;
int version;
int isrstatus;
   /* command line parameters */

  

   
 

   if (version=gpioInitialise()<0) return 1;
   printf(" gpio lib version %d \n\r",version);
   gpioSetMode(LED, PI_OUTPUT); // Set GPIO18 as output.
	gpioSetMode(SWITCH, PI_INPUT); // Set GPIO as input.
	isrstatus=gpioSetAlertFunc(SWITCH, isr);
//  
for (;;)
  {
	
	
	printf("waiting already   = %ds  isrsatus = %d \n\r",WaitCnt++,isrstatus );
	sleep(1);
    gpioWrite (LED, intrlvl) ;
  }
	isrstatus=gpioSetAlertFunc(SWITCH, 0);

   gpioTerminate();
}

