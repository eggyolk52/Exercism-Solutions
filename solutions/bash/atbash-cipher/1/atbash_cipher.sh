#!/bin/sh

result=""
cnt=0

[ "$1" = "encode" ] || [ "$1" = "decode" ] || exit 1

case "$1" in
    encode) encode=true ;;
    decode) ;;
    *) exit 1 ;;
esac

shift 1

str=$(printf '%s' "$*" | tr -d '[:punct:]')

for pos in $(seq ${#str}); do
    char=$(printf '%s' "$str" | cut -c "$pos" )
    char=$(printf '%s' "$char" | tr '[:upper:]' '[:lower:]')
    case $char in
        a) char=z ;; b) char=y ;; c) char=x ;; d) char=w ;; e) char=v ;;
        f) char=u ;; g) char=t ;; h) char=s ;; i) char=r ;; j) char=q ;;
        k) char=p ;; l) char=o ;; m) char=n ;; n) char=m ;; o) char=l ;;
        p) char=k ;; q) char=j ;; r) char=i ;; s) char=h ;; t) char=g ;;
        u) char=f ;; v) char=e ;; w) char=d ;; x) char=c ;; y) char=b ;;
        z) char=a ;; [0-9]) ;;
        *) continue ;;
    esac

    if [ $encode ]; then
        if [ "$cnt" != 0 ] && [ "$((cnt % 5))" = 0 ]; then
            result="$result $char"
        else
            result=$result$char
        fi
        cnt=$((cnt+1))
    else
        result=$result$char
    fi
done

echo "$result"