#!/bin/bash

NTASK=$1

inicio=100000
 final=1000000
  incr=100000


for i in $(seq $inicio $incr $final)
do
	sed -i "/#define LIMIT/c\#define LIMIT $i" mpi_prime.c
	mpicc -o mpi_prime mpi_prime.c -lm
	mpirun -machinefile machinefile -n $NTASK ./mpi_prime  > Output_mpi_prime/mpi_prime$i.out
done
cat Output_mpi_prime/* | sort -n > Output_mpi_prime/TOTAL_MPI_PRIME.out
rm -f Output_mpi_prime/mpi_prime*

