#!/usr/bin/sh

result=0
len=${#1}
for i in $(seq "$len"); do
    char=$(echo "$1" | cut -c "$i")
    result=$(echo "$char^$len + $result" | bc)
done

[ "$1" = "$result" ] && echo "true" || echo "false"