.PHONY: clean

#.PHONY : help

#help :
#        @echo -e 
#        @echo -e 

# assuming this github directories 
#PdevProj
#PdevUtils
#PeripheralDevices
#peripheral_dev_tst
# upctrl




TARGETS = test
TARGET_FLAG=__LINUX__

SRC      = ./src/
OBJ      = ./obj/
PDevPath = ../PeripheralDevices/
INCLSIPM      = -I ./incl/ \
			-I $(PDevPath)/I2Cinterfaces -I $(PDevPath)/DevInterfaces -I $(PDevPath)/LTC2633
BIN		= ./bin/
LIBPATH =  ../PdevProj/build 
CC = gcc

INCLPATH =  -I ./incl

.PHONY: all
all: adder_b adder blink_led6 check_and check_comlogic counterchk counter_explore counting_interrupt counting_polling dffchk digpr_pinchk freq_count_1 get2comp rbpi_and2a rbpi_blink rbpi_blink_simple rbpi_toglleall read_sw7 simple_arg statemachine_pulser sw7toled6 test test_muxout 



test :  
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@
	 
#needs the wiring PI lib for interrup routine 
counting_interrupt :
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@ -lpigpio -lwiringPi  -lpthread    -o $(BIN)/$@
	 
digpr_pinchk :
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@   -lpigpio -lwiringPi  -lpthread    -o $(BIN)/$@


SiPmCtrl :	 
	 g++ $(INCLSIPM) -D${TARGET_FLAG}  $(SRC)$@.cpp   -L $(LIBPATH) -ltstlib -lpigpio   -lpthread    -o $(BIN)/$@
	 
	 
muonctrl2022 :	 
	 g++ -fpermissive $(INCLSIPM) -D${TARGET_FLAG}  $(SRC)$@.cpp   -L $(LIBPATH) -ltstlib -lpigpio   -lpthread    -o $(BIN)/$@

	 
% :
	 $(CC) $(INCLPATH) $(SRC)$@.c   -lpigpio -lpthread   -o $(BIN)/$@

clean : 
	find bin  -perm /100 -type f  -delete 
