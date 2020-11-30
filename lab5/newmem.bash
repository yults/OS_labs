#!/bin/bash
vec=()
add=(1 2 3 4 5 6 7 8 9 10)
emp=""
echo $emp > report3.log
while [[ true ]] 
do
vec+=(${add[@]})
if [ "${#vec[@]}" -gt "$1" ]; then
break
fi
if [[ $cnt == 100000 ]]; then
echo "${#vec[@]}"
cnt=0
echo "${#vec[@]}" >> report3.log
fi
done
