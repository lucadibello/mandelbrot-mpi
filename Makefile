CC=mpicc
CFLAGS  = -O3 -I/opt/homebrew/include
LDFLAGS = -L/opt/homebrew/lib -lpng
NPROC ?= 4

all: mandel_mpi

run: mandel_mpi
	mpirun -np $(NPROC) ./mandel_mpi

mandel_mpi:  mandel_mpi.c pngwriter.c
	$(CC) $^ $(CFLAGS) $(LDFLAGS) -o $@

clean:
	rm -f mandel_mpi
