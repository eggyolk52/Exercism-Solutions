#!/usr/bin/sh

set -o noglob

phrase=$(echo $* | tr -d "\'" | tr '[:punct:]' ' ')
for word in $phrase; do
    acronym=$acronym$(echo "$word" | cut -c 1 | tr '[:lower:]' '[:upper:]')
done

echo "$acronym"