#!/bin/bash

[ "$#" = 2 ] || { echo "No enough args"; exit 1; }
echo "$@" | grep -E -oqx '[[:digit:] -.]+' || { echo "Non-numeric arguments"; exit 1; }

echo "x=$1; y=$2; d=sqrt(x^2 + y^2)
if (d <= 1) 10 else if (d <= 5) 5 else if (d <= 10) 1 else 0" | bc -l
