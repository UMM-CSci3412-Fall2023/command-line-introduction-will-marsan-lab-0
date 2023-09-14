#!/bin/bash 

#chmod +x extract_and_compile.sh
# Check if the script has been given one argument

arg=$1

#tar_file=$1

SCRATCH=`mktemp --directory`

#echo $SCRATCH

tar zxf NthPrime.tgz

cd NthPrime

gcc -o NthPrime main.c nth_prime.c

chmod +x main.c
chmod +x nth_prime.c

./NthPrime $arg

#rmdir $SCRATCH

# Argument passed to the script
# input_number="$1"

# Extract the tar archive NthPrime.tgz into a directory named NthPrime
#if ! tar -xzf NthPrime.tgz; then
#    echo
# "Error extracting the archive."
#    exit 2
#fi 
