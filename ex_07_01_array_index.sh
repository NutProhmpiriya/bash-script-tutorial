fruits=("apple" "banana" "cherry" "date" "fig")

echo ${fruits[0]}

for frut in ${fruits[@]}; do 
    echo $frut
done