#!/usr/bin/env bash 

say_hello() {
    local name=$1
    echo "Hello, $name!"
}

say_hello "John"
