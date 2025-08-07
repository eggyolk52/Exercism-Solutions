#!/usr/bin/sh

str=$(echo "$*" | tr -d '\n')

is_question () { echo "$str" | grep -q '\? *$'; }

is_capital () {
    { echo "$str" | grep -q '[A-Z]'; } &&
    ! { echo "$str" | grep -q '[a-z]'; }
}


[ -z "$(echo "$str" | tr -d '[:blank:]' | tr -d '\r')" ] && 
    echo 'Fine. Be that way!' && exit

if is_capital; then
    if is_question; then
        echo "Calm down, I know what I'm doing!"
    else
        echo "Whoa, chill out!"
    fi
else
    if is_question; then
        echo "Sure."
    else
        echo "Whatever."
    fi
fi