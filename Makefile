#.PHONY: clean

#.PHONY : help

#help :
#        @echo -e 
#        @echo -e 

TARGETS = test
TARGET_FLAG=__LINUX__

SRC      = ./src/
OBJ      = ./obj/
PDevPath = /home/pi/github/Pdev/PeripheralDevices/
INCLSIPM      = -I ./incl/ \
			-I $(PDevPath)/I2Cinterfaces -I $(PDevPath)/DevInterfaces -I $(PDevPath)/LTC2633
BIN		= ./bin/
LIBPATH = /home/pi/github/Pdev/peripheral_dev_tst/cmake
CC = gcc

INCLPATH =  -I ./Incl

test :  
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@
	 
#needs the wiring PI lib for interrup routine 
counting_interrupt :
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@  -lpigpio -lwiringPi  -lpthread    -o $(BIN)/$@
	 
SiPmCtrl :	 
	 g++ $(INCLSIPM) -D${TARGET_FLAG}  $(SRC)$@.cpp   -L $(LIBPATH) -ltstlib -lpigpio   -lpthread    -o $(BIN)/$@
	 
MuonCtrl1 :	 
	 g++ -fpermissive $(INCLSIPM) -D${TARGET_FLAG}  $(SRC)$@.cpp   -L $(LIBPATH) -ltstlib -lpigpio   -lpthread    -o $(BIN)/$@
	 
	 
% :
	 $(CC) $(INCLPATH) $(SRC)$@.c   -lpigpio -lpthread   -o $(BIN)/$@
