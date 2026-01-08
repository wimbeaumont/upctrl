#ifndef __PR_UTILS_H
#define __PR_UTILS_H

/* collection of functions to display etc of  "binary"  arrays 
	As C has not a binary type one can use arrays to represent a binary number 
	so the binary number "0001"  is stored in an int array B of size 4  with 
	B[0]=1 ; B[0]=0;B[0]=0 ;B[0]=0 ;  
	or more general 
	B[0]<> 0 ;B[0]=0;B[0]=0 ;B[0]=0 ;  
*/

/* 
 *	this function calculates the decimalvalue of a array of int that seen
	as binary numbers.  It only check if the value of an element is >0 , if 
	so it is considered as 1 else 0 . 
	If the size doesn't corresponds with the width of the array the program can crash 
	or other not predictable beheviour 
*/
unsigned int ar2decvalue(unsigned  int ar[] , int size ){
	
		int value =0 ;
		for( int cnt=size-1 ; cnt >= 0 ; cnt--) {			
			value=value <<1 ;
			if( ar[cnt] > 0) value|=1;
		}
		return value;
}

/* decompose the decimal to binary values and set the array elements 
   corresponding to 0 and 1.  
   The decimal value is roles over at 2^size ( so with 4 bits  16 ,32 and 0 gives the same result) 
   If the decimal value < 0 it will be set to 0 
*/ 

int decvalue2binar(int  value , int *ar , int size) {
	 int err=0;
	 if ( value < 0 ) { value =0; err=-1;}
	 
	for ( int cnt =0 ; cnt < size ; cnt++) {
		if( value  & 1) *ar =1; else *ar =0; 
		value=value >>1 ; 		
		*ar++; 
	}
	return err;
}
 
// calculates the parity of a binary array  
int parriy ( int ar[], int size ){
		int val=0;
		for ( int cnt=0 ; cnt < size ; cnt ++) {
			if ( ar[cnt] > 0) val++;
		}
		return val & 1;  // 0 if val is even else 1 
}
				
void  inv_bin_array(int  ar[], int size  ) {
		for ( int cnt=size-1  ; cnt >=0  ; cnt--) {
			if( ar[cnt])  ar[cnt]=0; else ar[cnt]=1;
		}
}	
// print the array so  "0010"  will be print a -0-0-1-0-
void  print_bin_arry_status (int  ar[], int size  ) {
		for ( int cnt=size-1  ; cnt >=0  ; cnt--) {
			if( ar[cnt])  printf ( "-1"); else printf ( "-0");
		}
		printf ( "-");
}

// convert the decimal number to a binary array 
int  print_dec_as_bin_array_status ( int value, const int nr_bits ) {
	int print_ar[nr_bits];
	int err= decvalue2binar( value , print_ar , nr_bits);
	print_bin_arry_status ( print_ar, nr_bits  );
	return err; 
}




#endif
