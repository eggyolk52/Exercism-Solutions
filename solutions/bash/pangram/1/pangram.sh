#!/usr/bin/sh

alpha="abcdefghijklmnopqrstuvwxyz"
for i in $(seq 26); do
    char=$(echo "$alpha" | cut -c "$i")
    echo "$1" | grep -iq "$char" || { echo false; exit; }
done

echo true