#!/bin/sh

str=$(printf '%s' "$*" | tr -d '[:space:]')

[ -z "$str" ] && echo "Fine. Be that way!" && exit

printf '%s' "$str" | grep -q '?$' && var=q

{ printf '%s' "$str" | grep -q '[A-Z]'; } &&
    ! { printf '%s' "$str" | grep -q '[a-z]'; } &&
        var="$var"c

case "$var" in
    "q") echo "Sure." ;;
    "c") echo "Whoa, chill out!" ;;
    "qc") echo "Calm down, I know what I'm doing!" ;;
    *) echo "Whatever.";;
esac