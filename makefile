CC = gcc
OBJ = o
OBJECTS = $(OBJ)/space.o $(OBJ)/command.o $(OBJ)/game.o $(OBJ)/game_loop.o $(OBJ)/graphic_engine.o $(OBJ)/screen.o $(OBJ)/game_reader.o $(OBJ)/player.o $(OBJ)/object.o $(OBJ)/die.o $(OBJ)/set.o $(OBJ)/inventory.o $(OBJ)/link.o
SRC = src
INC = include
TEST = test
CFLAGS = -g -Wall -ansi -pedantic -c
TestInv = $(OBJ)/inv_test.o $(OBJ)/inventory.o $(OBJ)/set.o
TestLink = $(OBJ)/link_test.o $(OBJ)/link.o
TestSpace = $(OBJ)/space_test.o $(OBJ)/space.o $(OBJ)/set.o
TestDie = $(OBJ)/die_test.o $(OBJ)/die.o
TestSet = $(OBJ)/set_test.o $(OBJ)/set.o

jail_game: $(OBJECTS)
	$(CC) -o jail_game $(OBJECTS)

TestSet: $(TestSet)
	$(CC) -o TestSet $(TestSet)
	./TestSet

TestDie: $(TestDie)
	$(CC) -o TestDie $(TestDie)
	./TestDie

TestSpace: $(TestSpace)
	$(CC) -o TestSpace $(TestSpace)
	./TestSpace

TestLink: $(TestLink)
	$(CC) -o TestLink $(TestLink)
	./TestLink

TestInv: $(TestInv)
	$(CC) -o TestInv $(TestInv)
	./TestInv


$(OBJ)/command.o : $(SRC)/command.c $(INC)/command.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/command.c -o$@ -I$(INC)

$(OBJ)/game.o : $(SRC)/game.c $(INC)/game.h $(INC)/game_reader.h $(INC)/space.h $(INC)/player.h $(INC)/object.h $(INC)/die.h $(INC)/command.h $(INC)/link.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/game.c -o$@ -I$(INC)

$(OBJ)/game_reader.o : $(SRC)/game_reader.c $(INC)/game_reader.h $(INC)/game.h $(INC)/space.h $(INC)/player.h $(INC)/object.h $(INC)/link.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/game_reader.c -o$@ -I$(INC)

$(OBJ)/game_loop.o : $(SRC)/game_loop.c $(INC)/graphic_engine.h $(INC)/command.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/game_loop.c -o$@ -I$(INC)

$(OBJ)/graphic_engine.o : $(SRC)/graphic_engine.c $(INC)/graphic_engine.h $(INC)/game.h $(INC)/space.h $(INC)/screen.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/graphic_engine.c -o$@ -I$(INC)

$(OBJ)/screen.o : $(SRC)/screen.c $(INC)/screen.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/screen.c -o$@ -I$(INC)

$(OBJ)/space.o : $(SRC)/space.c $(INC)/space.h $(INC)/types.h $(INC)/set.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/space.c -o$@ -I$(INC)

$(OBJ)/object.o : $(SRC)/object.c $(INC)/object.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/object.c -o$@ -I$(INC)

$(OBJ)/player.o : $(SRC)/player.c $(INC)/player.h $(INC)/types.h $(INC)/inventory.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/player.c -o$@ -I$(INC)

$(OBJ)/set.o : $(SRC)/set.c $(INC)/set.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/set.c -o$@ -I$(INC)

$(OBJ)/die.o : $(SRC)/die.c $(INC)/die.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/die.c -o$@ -I$(INC)

$(OBJ)/inventory.o : $(SRC)/inventory.c $(INC)/inventory.h $(INC)/set.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/inventory.c -o$@ -I$(INC)

$(OBJ)/link.o : $(SRC)/link.c $(INC)/link.h $(INC)/space.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(SRC)/link.c -o$@ -I$(INC)

$(OBJ)/inv_test.o: $(TEST)/inv_test.c $(INC)/inv_test.h $(INC)/inventory.h $(INC)/test.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(TEST)/inv_test.c -o$@ -I$(INC)

$(OBJ)/link_test.o: $(TEST)/link_test.c $(INC)/link_test.h $(INC)/link.h $(INC)/test.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(TEST)/link_test.c -o$@ -I$(INC)

$(OBJ)/space_test.o: $(TEST)/space_test.c $(INC)/space.h $(INC)/space_test.h $(INC)/test.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(TEST)/space_test.c -o$@ -I$(INC)

$(OBJ)/die_test.o: $(TEST)/die_test.c $(INC)/die.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(TEST)/die_test.c -o$@ -I$(INC)

$(OBJ)/set_test.o: $(TEST)/set_test.c $(INC)/set.h $(INC)/types.h
	@echo "#---------------------------"
	@echo "# Generando $@"
	@echo "# Depende de $^"
	@echo "# Ha cambiado $<"
	$(CC) $(CFLAGS) $(TEST)/set_test.c -o$@ -I$(INC)
#tar:
#	tar -zcvf I2_Grupo2161_JavierMartin_GonzaloMartinez.tar.gz *.h *.c *.dat *.log *.txt makefile README.txt

.PHONY: clean saveclean tar jail_game_test inv_test link_test space_test die_test set_test doxy

tar:
	tar -zcvf I2_Grupo2161_JavierMartin_GonzaloMartinez.tar.gz $(OBJ) $(TEST)/*.c $(INC)/*.h $(SRC)/*.c *.dat makefile

clean:
	rm -f $(OBJ)/*.o jail_game TestDie TestSet TestInv TestLink TestSpace Doxyfile *.tar.gz *.log *.bak *~

saveclean:
	rm -f *.sv *.save

jail_game_test:
	./jail_game new_data.dat -l comandos.log

doxy:
	doxygen -g
	doxygen Doxyfile
