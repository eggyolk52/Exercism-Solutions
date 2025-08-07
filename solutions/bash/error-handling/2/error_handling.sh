#!/usr/bin/sh

[ "$#" = 1 ] && echo "Hello, $1" ||
    { echo "Usage: error_handling.sh <person>"; exit 1; }