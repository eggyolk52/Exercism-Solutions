#!/bin/sh

# TZ=Europe/Berlin
printf '%(%Y-%m-%dT%H:%M:%S)T\n' $(( $(date -d "$1" '+%s') + 1000000000 ))

# start=$(date -d "$1" +%s)
# result=$((start + 1000000000))
# date -d "@$result" +%Y-%m-%dT%H:%M:%S
