#.PHONY: clean

#.PHONY : help

#help :
#        @echo -e 
#        @echo -e 

TARGETS = test


SRC      = ./src/
OBJ      = ./obj/
INC      = ./incl/
BIN		= ./bin/

CC = gcc

INCLPATH =  -I $(INC) 

test :  
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@
	 
#needs the wiring PI lib for interrup routine 
counting_interrupt :
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@   -lpigpio -lwiringPi  -lpthread    -o $(BIN)/$@

% :
	 $(CC) $(INCLPATH) $(SRC)$@.c   -lpigpio -lpthread   -o $(BIN)/$@
