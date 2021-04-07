CC=gnatmake
FLAGS=-gnatwae

all: hello vowels calc box animals clean

hello:
	$(CC) $(FLAGS) hello_world.adb

loops:
	$(CC) $(FLAGS) loops.adb

vowels:
	$(CC) $(FLAGS) vowels.adb

calc:
	$(CC) $(FLAGS) calculator.adb

box:
	$(CC) $(FLAGS) box_geometry.adb

animals:
	$(CC) $(FLAGS) animals.adb

clean:
	rm *.ali *.o

super_clean:
	rm *.ali *.o hello_world loops vowels calc box_geometry animals
