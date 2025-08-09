#!/usr/bin/sh

[ -z "$*" ] || [ "$#" = 1 ] && 
    { echo "Usage: hamming.sh <string1> <string2>"; exit 1; }
[ "${#1}" != "${#2}" ] && 
    { echo "strands must be of equal length"; exit 1; }

cnt=0
for i in $(seq ${#1}); do
    [ "$(echo "$1" | cut -c "$i")" != "$(echo "$2" | cut -c "$i")" ] &&
        cnt=$((cnt+1))
done

echo "$cnt"