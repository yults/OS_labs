#!/bin/bash
m="$1"
if [[ "$2" -gt "$1" ]]
then m="$2"
fi
if [[ "$3" -gt "$m" ]]
then m="$3"
fi
echo "$m"
