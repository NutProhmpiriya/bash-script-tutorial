#!/usr/bin/env bash 

read -p "Enter score (0-100): " score

if [ $score -lt 0 ] || [ $score -gt 100 ]; then 
    echo "Error: Score must be between 0-100"
    exit 1 
fi 

if [ $score -ge 80 ]; then
    grade="A"
elif [ $score -ge 70 ]; then
    grade="B"
elif [ $score -ge 60 ]; then
    grade="C"
elif [ $score -ge 50 ]; then
    grade="D"
else 
    grade="F"
fi

echo "Score: $score"
echo "Grade: $grade"
