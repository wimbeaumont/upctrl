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

CC = g++ 

INCLPATH =  -I $(INC) 

test :  
	 $(CC) $(INCLPATH) $(SRC)$@.c -o $(BIN)/$@

% :
	 $(CC) $(INCLPATH) $(SRC)$@.c   -lpigpio -lpthread   -o $(BIN)/$@

