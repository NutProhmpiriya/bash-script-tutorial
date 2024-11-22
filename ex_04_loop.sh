#!/usr/bin/env bash 

# basic for loop
for i in 1 2 3 4 5; do 
    echo "number: $i"
done

# rang with seq
for i in $(seq 1 5); do
    echo "Number: $i"
done
