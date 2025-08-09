#!/bin/sh

str=$(echo "$*" | tr -d '[:space:]')
echo "$str" | grep -qxE '[0-9][0-9]+' || { echo false; exit; }

for char_n in $(seq ${#str} | sort -gr); do
    char=$(echo "$str" | cut -c "$char_n")
    if [ $((${cnt:-1} % 2)) -eq 0 ]; then
        char=$((char * 2))
        if [ "$char" -gt 9 ]; then
            char=$((char - 9))
        fi
    fi
    result=$char$result
    cnt=$((${cnt:-1} + 1))
done

for char_n in $(seq ${#result}); do
    char=$(echo "$result" | cut -c "$char_n")
    sum=$((${sum:-0} + char))
done

[ $((sum % 10)) -eq 0 ] && echo true || echo false