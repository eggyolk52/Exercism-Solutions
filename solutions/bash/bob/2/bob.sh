#!/usr/bin/sh

str=$(echo "$*" | tr -d '[:space:]')

[ -z "$str" ] && echo "Fine. Be that way!" && exit

echo "$str" | grep -q '?$' && var=q

{ echo "$str" | grep -q '[A-Z]'; } &&
    ! { echo "$str" | grep -q '[a-z]'; } &&
    var="$var"c

case "$var" in
    "q") echo "Sure." ;;
    "c") echo "Whoa, chill out!" ;;
    "qc") echo "Calm down, I know what I'm doing!" ;;
    *) echo "Whatever.";;
esac