# firmware upcntr.  SiPm readout 

This is the firmware for the counting of the pulses from the SiPm's 

To start the project import SiPm.xise into ise 14.7 

You will informed about a missing   file clksrc.xise 

tick the box :   remove unspecified files from the project  and click on ok
 
then  in Hierachy window click right and do add source   and incude  ./ipcore_dir/clksrc.xco

You will be asked to regenerate the ip.  click on yes 

The topology is the same as for the digpr2  ( couners ) 
But for the selection there is implemented a register bank.  First the address of the register has to be selected , then the data .   
GPIO15	:	IN	STD_LOGIC; 	-- used to sel data or reg addr write 		 
clk3  	:	IN	STD_LOGIC;  -- used for register write data valid 
The data is clocked in with the 100MHz clock 

The input for the and can be choosen between direct from the pulse inputs are  from a pulsestrecher . 

The counter enable can be D2 input only or from a down counter .  The upper 8 bits can be set via a register . 








