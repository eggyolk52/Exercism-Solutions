#!/bin/sh

for i in $(seq ${#1}); do
    res=$(echo "$1" | cut -c "$i")$res
done
echo "$res"
