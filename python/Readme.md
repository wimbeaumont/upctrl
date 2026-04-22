This code is converted from the C++ code 
using
https://www.codeconvert.ai/c-to-python-converter

status  20240222   :  most programs are checked , the "modules" are not all checked as the functions are not all called already 


before running the program 

sudo systemctl start pigpiod 

pigpiod makes use of a client server  configuration so not very efficient. 


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


 


some links 



