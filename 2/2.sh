#!/bin/bash

# Exercise 2
# Print in ascending order all integers (K) from L to P, where K, L and P are variables.
# L < K < P
# If K equals to existing UID, then don't print it.
# You're only inputing 2 variables, L and P.

if [ $# -lt 2 ]; then
    echo "Usage: $0 <from> <to>"
    exit 1
fi

L=$1
P=$2

for K in `seq $1 $2`; do
    OUTPUT=`cat /etc/passwd | grep ".*:.*:$K"`
    LENGTH=${#OUTPUT} # length of string
    if [ $LENGTH -eq 0 ]; then
        echo $K;
    fi
done