#!/bin/bash
vec=()
add=(1 2 3 4 5 6 7 8 9 10)
emp=""
echo $emp > report.log
cnt=0
while [[ true ]]
do
let cnt=$cnt+1
vec+=(${add[@]})
if [[ $cnt == 100000 ]]; then
echo "${#vec[@]}"
cnt=0
echo "${#vec[@]}" >> report.log
fi
done

