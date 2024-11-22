# Bash Script Guide

## Basic Script Structure

```bash
#!/usr/bin/env bash
# Description: Your script description
```

## Key Concepts

### 1. Variables

```bash
name="John"
echo "Hello, $name"
```

### 2. Input/Output

```bash
read -p "Enter name: " name
echo "Output text"
```

### 3. Control Flow

```bash
# If statements
if [ condition ]; then
    echo "True"
fi

# Loops
for i in {1..5}; do
    echo $i
done

while [ condition ]; do
    echo "Loop"
done
```

### 4. Functions

```bash
function_name() {
    local param=$1
    echo "Parameter: $param"
}
```

### 5. Arrays

```bash
fruits=("apple" "banana" "orange")
echo ${fruits[0]}
echo ${fruits[@]}
```

## Common Operations

### File Operations

```bash
touch file.txt
mkdir directory
rm file.txt
cp source dest
mv old new
```

### Permissions

```bash
chmod +x script.sh  # Make executable
chmod 755 file      # Set specific permissions
```

### Running Scripts

1. Make executable: `chmod +x script.sh`
2. Run: `./script.sh` or `bash script.sh`

## Best Practices

1. Always include shebang line
2. Use meaningful variable names
3. Comment your code
4. Handle errors appropriately
5. Test for edge cases

## Debugging

- Add `set -x` for debug mode
- Use `echo` for debugging
- Check exit codes with `$?`
