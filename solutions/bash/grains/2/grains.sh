#!/bin/sh

{ [ "$1" -lt 1 ] || [ "$1" -gt 64 ] && echo 'Error: invalid input' && exit 1
} 2>/dev/null

if [ "$1" = total ]; then
    printf 'ibase=2
    1111111111111111111111111111111111111111111111111111111111111111
    ' | bc
else
    printf '2^%s\n' "$(($1-1))" | bc
fi