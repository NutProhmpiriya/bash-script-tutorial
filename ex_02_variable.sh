#!/usr/bin/env bash 

echo "Please enter your informantion"
read -p "Name: " name
read -p "Age: " age 
read -p "City: " city

current_year=$(date +%Y)
birth_year=$((current_year - age))

echo "" 
echo "--- Personal Information ---" 
echo "Name: $name"
echo "Age: $age"
echo "City: $city"
echo "Birth Year: $birth_year"
echo "---------------------------"


