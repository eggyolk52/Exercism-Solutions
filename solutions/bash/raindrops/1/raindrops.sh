#!/usr/bin/sh

[ $(($1 % 3)) = 0 ] && str=Pling
[ $(($1 % 5)) = 0 ] && str="$str"Plang
[ $(($1 % 7)) = 0 ] && str="$str"Plong

echo "${str:-$1}"