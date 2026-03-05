This code is converted from the C++ code 
using
https://www.codeconvert.ai/c-to-python-converter

status  20240222   :  most programs are checked , the "modules" are not all checked as the functions are not all called already 


below is has to be cleaned up 
Try to use gpiozero  not comptible with the used structure. 

instead use lgpio 
user should be member of the gpio group 
sudo adduser digpr gpio
for python it  runs without deamon . 
for python a wraper is written ( piwrapper.py ) so the lib can be used with the already existing code with a few adaptations .

remove the standard installed obsolte lib  
sudo apt remove python3-rpi.gpio

python3 -m venv --system-site-packages uCtrl

source uCtrl/bin/activate

pip install lgpio 


before using lgpio lib tried with the pigiod lib.  But this seems not to be compatible with newer releases . 
before running the program 
sudo systemctl start pigpiod 
pigpiod makes use of a client server  configuration so not very efficient. 

 
SiPmCtrllib.py
This is a wrapper to set the bias level and discrimination level for the SiPm control and readout board. 
These levels are set by the LTC2633. DAC. 
As this code was available in a more general IO  package it was decided to reuse the code and write a python wrapper 
The lib is in the PdevProj repository .  This is a repository that depens on other repositories.  
See the Readme in the PdevProj how to build the libSiPmCtrllib.so. It is also useful to build SiPmCtrl2 ( C program) to check if the functions for of the lib are correctly working.
Once the lib is build in the PdevProj/build folder  , cd to that folder and do export LD_LIBRARY_PATH=$PWD  

Problem is that the symbol setBiasVoltage  is not defined it the lib . 
To find the name to be used in the wrapper  
do 
$nm -D libSiPmCtrllib.so  | grep setBi
the resonse is something like 0000000000003a38 T _Z14setBiasVoltageif
For the wrapper use as lib symbol Z14setBiasVoltageif  .



some links 

PDevProj repository : 

