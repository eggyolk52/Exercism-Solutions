#!/bin/sh

{ [ "$1" -lt 1 ] || [ "$1" -gt 64 ] && echo 'Error: invalid input' && exit 1
} 2>/dev/null


# `$(())` does not work with big numbers, but `bc` is slower.
square=1
if [ "$1" = 'total' ]; then
    total=1
    for _ in $(seq 63); do
        square=$(echo $square \* 2 | bc)
            total=$(echo $total + "$square" | bc)
    done
    echo "$total"

elif [ "$1" -eq 64 ]; then
    for _ in $(seq $(($1 - 1))); do
        square=$(echo "$square" \* 2 | bc)
    done
    echo "$square"

elif [ "$1" -lt 64 ]; then
    for _ in $(seq $(($1 - 1))); do
        square=$((square * 2))
    done
    echo $square

fi