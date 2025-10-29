#!/usr/bin/sh

word=$(echo "$1" | tr '[:upper:]' '[:lower:]')

score=0
add () { score=$((score + $1)); }

for pos in $(seq ${#word}); do
    letter=$(echo "$word" | cut -c "$pos") 
    case $letter in
        a|e|i|o|u|l|n|r|s|t) add  1 ;;
        d|g)                 add  2 ;;
        b|c|m|p)             add  3 ;;
        f|h|v|w|y)           add  4 ;;
        k)                   add  5 ;;
        j|x)                 add  8 ;;
        q|z)                 add 10 ;;
        *) ;;
    esac
done

echo $score