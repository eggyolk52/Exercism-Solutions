#!/usr/bin/env bash

# if [ -n "$1" ]; then
#     echo "One for $1, one for me."
# else
#     echo "One for you, one for me."
# fi

[ -n "$1" ] && name=$1 || name=you
echo "One for $name, one for me."