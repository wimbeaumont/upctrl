/** program to controll the bias and trigger levels for a two channel 
 *  SiPm readout board 
 *  for more info see the README.MD of the repository 
 *  https://github.com/wimbeaumont/peripheral_dev_tst.git
 *  this version is mainly targeting testing on a Linux ( e.g. Raspberry Pi) platform 
 *  V 1.60  :  stripped version of SiPmCtrl (v 1.51 ) for upctrl  only Raspberry Pi
 * (C) Wim Beaumont Universiteit Antwerpen 2019
 *  License see
 *  https://github.com/wimbeaumont/PeripheralDevices/blob/master/LICENSE
 
  * combined with the readout of an FPGA with counters 
 */ 


/*
compilation see Makefile
*/

#define MUONCTRL1 "1.60"

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include <string>
// includes for Raspberry Pi IO  / FPGA
#include "pr_utils.h" 
#include "cce_1_def.h" 

// setup the I2C and device libs 

#define  OS_SELECT "linux_i2c" 

#include <cstdio>
#include <cstdlib>
#include "LinuxI2CInterface.h"

char *filename = (char*)"/dev/i2c-1";  //hard coded for the moment 
LinuxI2CInterface  mbedi2c(filename);
LinuxI2CInterface* mbedi2cp= &mbedi2c;

//------------------ end Linux I2C specific config
#include "DACInterface.h" 
#include "dev_interface_def.h"
#include "ltc2633.h"

I2CInterface* i2cdev= mbedi2cp;
const float Vrefext=5.0;

void  setbytesel(int bytesel){
 	// the pins are hard coded 
	switch(bytesel) {
		case 1 : gpioWrite (GPIO22,1);
			     gpioWrite (clk1,0);  
		break;
		case 2 : gpioWrite (GPIO22,0);
			     gpioWrite (clk1,1);  
		break;
		case 3 : gpioWrite (GPIO22,1);
			     gpioWrite (clk1,1);  
		break;
		default : gpioWrite (GPIO22,0);
			     gpioWrite (clk1,0);  
	}
}	



using namespace std;
int main(int argc, char *argv[]){
	
	// initalize the SiPm board devices 
	// so something to do with the hardware so first initialize  		
   int bias_ctrl_addr= 0x12;  //CAO at 5 Vdd
   int discr_lvl_addr= 0x10;  //CAO at 0 Vdd
   int Vreftype=1 , resolution=12;
   string target;
   LTC2633  biasctrl(i2cdev, bias_ctrl_addr,  Vrefext ,Vreftype , resolution  );
   LTC2633  discr_lvl(i2cdev, discr_lvl_addr,  Vrefext ,Vreftype , resolution  );
   LTC2633*  dacp= &biasctrl;
   i2cdev->wait_for_ms(1000);
   int errcode;
   // set the bias to 0 
   float bvolt[2] = {50 , 50}; 
   //float lvolt[2] = {130 , 335}; 
   float lvolt[2] = {230 , 435}; 
   for (int ch=0 ; ch < 2 ; ch++) {
		errcode= biasctrl.setDACvalue(int(bvolt[ch]) ,ch);  
		if (errcode ){	printf("failed to set biasctrl value %d for channel %d errcode %d\n\r",int(bvolt[ch]) ,ch,errcode);
						return -1;  // if not working make no sense to continue
		}	
		else printf(" set DAC bias  ch %d to %d \n\r",ch, int(bvolt[ch]));
		errcode= discr_lvl.setDACvalue(int(lvolt[ch]) ,ch);  
		if (errcode ){	printf("failed to set lvlctrl value %d for channel %d errcode %d\n\r",int(lvolt[ch]) ,ch,errcode);
						return -1;  // if not working make no sense to continue
		}	
		else printf(" set DAC lvl ch %d to %d \n\r", ch, int(lvolt[ch]));
   }

	
	
    int counts[3][4];
	int totalcnt [3];
   int ls[8];// read status 
   printf("start program %s\n\r", argv[0]);
  
	int err= init_cce_2();
	if (err) {
		printf("initialization of hardware failed with err %d \n\r", err);
		return err; 
	}
 	gpioSetMode(clk1, PI_OUTPUT);  // for byte sel   , gpio 22 is already set as output in  init_cce_2();
 	gpioSetMode(clk3, PI_OUTPUT);
	gpioSetMode(14, PI_OUTPUT);
	const int start=clk3;
	const int datavalid = 14 ;
	setup_output_array( Dpins, 8); // to set the window counter no check for errors 
	
	set_muxout2( 0,8); // low byte 
	set_D_outputs( 8,2);
	gpioWrite (datavalid,1);
	gpioWrite (datavalid,0);
	set_muxout2( 1,8); // high  byte 
	set_D_outputs( 8,1);
	gpioWrite (datavalid,1);
	gpioWrite (datavalid,0);
	set_muxout2( 2,8); // magic settings 
	set_D_outputs( 8,1);
	gpioWrite (datavalid,1);
	gpioWrite (datavalid,0);
	
	
	// check  Time low 
	//set_muxout2( 3,4); // 
	//get_led_status_bin(ls,8);
	//printf("  LowByte Window timer is %d \n\r" ,  ar2decvalue(ls,8));
	 
	gpioSetMode(GPIO18,PI_OUTPUT);
	float  corfact=1 , lvoltstart=0,  lvoltstop=10, lvoltstep=1;
	int lvlch[2]={0,0};
	//  loop over threshold levels  
	//dacp= &discr_lvl; corfact=1;lvoltstart=0; lvoltstop=370; lvoltstep=20;target=" lvl";
	// loop over bias voltages 
	dacp= &biasctrl; corfact=1/0.0342;lvoltstart=64.5;  lvoltstop=65.5; lvoltstep=.05;target="bias";
	 
	for ( float  lvolt = lvoltstart ; lvolt < lvoltstop ; lvolt=lvolt+lvoltstep) {
		for (int ch=0 ; ch < 2 ; ch++) {
			int lcvolt=int(lvolt*corfact);
			errcode= dacp->setDACvalue(lcvolt ,ch);  
			if (errcode ){	printf("failed to set biasctrl value %d for channel %d errcode %d\n\r",int(lvolt) ,ch,errcode);
						return -1;  // if not working make no sense to continue
			}	
			//else printf(" set Lvl bias ch %d to %d \n\r", ch, int(lvolt));
			lvlch[ch]=lcvolt;
		}
		gpioWrite (GPIO18, 1) ;	 //clear counters 
		gpioWrite (GPIO18, 0) ;		
		set_muxout2( 6,8);// for LED info 
		gpioWrite(start,1); //activate the time window 
		gpioWrite(start,0);
		sleep(3); // optimimize 
	
		// read the counters 
		for (int  cnt=0;cnt < 3; cnt++){
			set_muxout2( cnt,4);			
			totalcnt[cnt]=0;
			for (int bytesel =1; bytesel >= 0 ; bytesel--) {
				setbytesel(bytesel);				
				//printf("muxsel %d %d  bytesel %d  %d ",gpioRead(MUXSEL1) ,gpioRead(MUXSEL0) ,gpioRead(clk1), gpioRead(GPIO22));
				get_led_status_bin(ls,8);
				counts[cnt][bytesel]=  ar2decvalue(ls,8);
				//printf("coun[%d][%d] = %d \n\r", cnt,bytesel,counts[cnt][bytesel]);
				totalcnt[cnt]= totalcnt[cnt]*256 + counts[cnt][bytesel];
			}
		}	
		
		printf("%sch0 %4d  count1= %6d ",target.c_str(),lvlch[0], totalcnt[0]);
		printf("AND  count2= %6d  ", totalcnt[1]);
		printf("%sch1 %4d  count3= %6d\n\r",target.c_str(), lvlch[1], totalcnt[2]);	
		set_muxout2( 6,8);
	}
   gpioTerminate();
}

