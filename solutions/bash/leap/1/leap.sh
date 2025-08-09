#!/bin/sh

{ echo "$@" | grep -E -q "^ *[0-9]+ *$"; } || { echo "Usage: leap.sh <year>"; exit 1; }

case 0 in
    ($(($1 % 400))) echo 'true';;
    ($(($1 % 100))) echo 'false';;
    ($(($1 %   4))) echo 'true';;
    0) echo 'false'
esac
