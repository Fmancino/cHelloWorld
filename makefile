# See:
# https://stackoverflow.com/questions/1484817/how-do-i-make-a-simple-makefile-for-gcc-on-linux

# The name of your final program
TARGET = prog
LIBS = -lm

# Your compiler and flags
CC = gcc
CFLAGS = -g -Wall

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)

# Default way of running the program
# To compile and run:
# make run
run: default
	./$(TARGET)
