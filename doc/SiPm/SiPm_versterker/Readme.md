last edit 20260403 
Wim Beaumont 

information how to connect the SiPm amplifier board to the Atlys board. 


interface board 

zet de I2C bus voltage op 3.3 V  ( in de SiPm zit een translator naar 5V)  
jumper X3 pin 1 en 2 , Pin1 is waar  X3 staat . 
Sluit de 3 pins molex connector aan op XP1  .  3.3V  is aan de pin in de hoek van de PCB. 

SiPmStudentv12_sch.pdf  original. 

SiPmAmplifier20200229.pdf 
the first stage is now feed on the  negative input .   
The change is not done on the PCB  but with some patch work. 
component changes in amplifier chain.  (only in channel 0 ) 

