#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>


/*

gcc -o simple_arg simple_arg.c 

program to demonstrate to use comand line arguments in a c program in a very simple way


*/


int main(int argc, char *argv[]) {
	const int nr_arg_expected;
	int intarg[nr_arg_expected];
	// first check if there are enough arguments, we expect 2 
	// the program call itself is always the first argument so 
	// we need more then 2 
    if ( argc > nr_arg_expected ) {		
		for ( int nr_arg=0; nr_arg < nr_arg_expected ; nr_arg++) {
			intarg[nr_arg] = atoi(argv[nr_arg+1]);
			// check here if the input is reasonable if not exit 
		}
	}else { printf(" program %s need at least %d arguments  %d\n\r", argv[0], nr_arg_expected );
			return -1;
	}
	printf("start program %s with arguments :\n\r ", argv[0]);
	for ( int nr_arg=0 ; nr_arg < nr_arg_expected ; nr_arg++){
		printf(" arg %d , in %s , result in int : %d\n\r",nr_arg, argv[nr_arg+1],intarg[nr_arg]);
	}
   return 0;
}

