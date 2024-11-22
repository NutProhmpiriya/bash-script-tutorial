#!/usr/bin/env bash

add() {
    echo "$(($1 + $2))"
}

subtract() {
    echo "$(($1 - $2))"
}

multiply() {
    echo "$(($1 * $2))"
}

divide() {
    if [ $2 -eq 0 ]; then 
        echo "Error: Cannot divide by zero"
        exit 1 
    fi 

    # ใช้ floating point arithmetic แบบพื้นฐาน
    printf "%.2f\n" $(echo "$1/$2" | awk '{printf "%.2f", $1}')
}

read -p "Enter first number: " num1 
read -p "Enter second number: " num2 

echo "Results: "
echo "Addition: $(add $num1 $num2)"
echo "Subtraction: $(subtract $num1 $num2)"
echo "Multiplication: $(multiply $num1 $num2)"
echo "Division: $(divide $num1 $num2)"