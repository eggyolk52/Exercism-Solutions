#!/bin/sh

digits="$1"
length="$2"
res=""

[ "$digits" = "" ] && { echo 'series cannot be empty'; exit 1; }
[ "${#digits}" -lt "$length" ] &&
    { echo 'slice length cannot be greater than series length'; exit 1; }
[ "$length" -eq 0 ] && { echo 'slice length cannot be zero'; exit 1; }
[ "$length" -le 0 ] && { echo 'slice length cannot be negative'; exit 1; }

for i in $(seq ${#digits}); do
    if [ $((i + length - 1)) -le "${#digits}" ]; then
        for j in $(seq "$length"); do
            res=$res"$(echo "$digits" | cut -c $((i + j - 1)))"
        done
        res=$res" "
    fi
done
echo "$res" | sed 's/ $//'
