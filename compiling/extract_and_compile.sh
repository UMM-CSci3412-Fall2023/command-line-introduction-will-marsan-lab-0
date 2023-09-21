#!/bin/bash 

# Accpets one argument 
arg=$1

# Extract the contents of NthPrime.tgz
tar zxf NthPrime.tgz

# Go to to NthPrime directory 
cd NthPrime

# Make main.c and nth_prime.c executable 
gcc -o NthPrime main.c nth_prime.c

# Not sure if these chmod's do anything that wasn't already 
# done above but if it ain't broke don't fit it right?
chmod +x main.c
chmod +x nth_prime.c

# Call the c programs with the argument accepted in the first step
./NthPrime $arg

