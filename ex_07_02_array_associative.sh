declar -A user
user=([name]="John" [surname]="Doe" [age]=30)

echo "Name: ${user[name]}"

for key in "${!user[@]}"; do
    echo "$key: ${user[$key]}"
done