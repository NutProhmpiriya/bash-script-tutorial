#!/usr/bin/env bash 

read -p "Enter a number (1-12): " number

if [ $number -lt 1 ] || [ $number -gt 12]; then 
    echo "Error: Please enter a number between 1-12"
    exit 1
fi 

echo "Multiplication table for $number:"
echo "-----------------------"

for i in $(seq 1 12); do 
    result=$((number * i))
    echo "$number x $i = $result"
done 

echo "-----------------------"