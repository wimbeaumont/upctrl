This code is converted from the C++ code 
using
https://www.codeconvert.ai/c-to-python-converter

status  20240222   :  most programs are checked , the "modules" are not all checked as the functions are not all called already 


before running the program 

sudo systemctl start pigpiod 

pigpiod makes use of a client server  configuration so not very efficient. 


below is has to be cleaned up 
Try to use gpiozero 
set the environment variable export GPIOZERO_PIN_FACTORY=native 
user should be member of the gpio group 
sudo adduser digpr gpio


sudo apt install python3-lgpio

(The following packages will be REMOVED:
  rpi.gpio-common

) 
sudo apt remove python3-rpi.gpio

python3 -m venv --system-site-packages uCtrl

source uCtrl/bin/activate

 


some links 



