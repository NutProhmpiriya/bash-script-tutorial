#!/usr/bin/env bash

number=10

if [ $number -gt 5 ]; then
    echo "Number is greater than 5"
elif [ $number -eq 5 ]; then
    echo "Number is equal to 5"
else 
    echo "Number is less than 5"
fi