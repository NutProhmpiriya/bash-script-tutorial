#!/usr/bin/env bash

random_number=$((1 + RANDOM % 100))
attempts=0

echo "Welcome to the guessing game!"
echo "I'm thinking of a number between 1 and 100" 

while true; do 

    read -p "Enter your guess: " guess 
    attempts=$((attempts + 1))

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number"
        continue
    fi 

    if [ $guess -eq $random_number ]; then
        echo "Congratulations! You've guessed the number!"
        echo "It took you $attempts attempts"
        break
    elif [ $guess -gt $random_number ]; then 
        echo "Too hight!"
    else 
        echo "Too low!"
    fi 
done 

