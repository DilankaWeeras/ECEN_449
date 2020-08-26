CC=gcc
CFLAGS=-c -Wall

all: final

final: main.o block1.o block2.o
	$(CC) main.o block1.o block2.o -o final

main.o: main.c
	$(CC) $(CFLAGS) main.c

block1.o: block1.c block1.h
	$(CC) $(CFLAGS) block1.c

block2.o: block2.c block2.h
	$(CC) $(CFLAGS) block2.c

clean:
	rm -f final *.o