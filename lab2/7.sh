#!/bin/bash
for x in $(ps -Ao pid,command | tail -n +2 | awk '{print $1":"$2}')
do
pid=$(echo $x | awk -F ":" '{print $1}')
commmand=$(echo $x | awk -F ":" '{print $2}')
if [ -f "/proc/"$pid/io ]
then
rbytes=$(grep -h "read_bytes:" "/proc/"$pid/io | sed "s/[^0-9]*//")
echo "$pid $cmd $rbytes"
fi
done | sort -nk1 > 7beforesleep.txt
sleep 1m
for x in $(ps -Ao pid,command | tail -n +2 | awk '{print $1":"$2}')
do
pid=$(echo $x | awk -F ":" '{print $1}')
commmand=$(echo $x | awk -F ":" '{print $2}')
if [ -f "/proc/"$pid/io ]
then
rbytes=$(grep -h "read_bytes:" "/proc/"$pid/io | sed "s/[^0-9]*//")
echo "$pid $cmd $rbytes"
fi
done | sort -nk1 > 7aftersleep.txt
cat 7aftersleep.txt | while read s
do
pid=$(echo "$s" | awk '{print $1}')
m0=$(echo "$s" | awk '{print $3}')
cmd=$(echo "$s" |awk '{print $2}')
m1=$(cat 7beforesleep.txt | awk -v id="$pid" '{if ($1 == id) print $3}')
mdiff=$((m1 - m0))
echo $pid":"$cmd":"$mdiff
done | sort -t ':' -nrk3 | head -3
