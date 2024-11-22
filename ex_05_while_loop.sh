#!/usr/bin/env bash 

while true; do 
    read -p "enter a number (1-12): " number 

    if [ $number -ge 1 ] && [ $number -le 12 ]; then
        break 
    else 
        echo "Invalid number, please try again"
    fi 
done 

echo "Multiplication table for $number:"
echo "---------------------------------"

i=1
while [ $i -le 12 ]; do 
    result=$((number * i))
    echo "$number x $i = $result"
    i=$((i + 1))
done 

