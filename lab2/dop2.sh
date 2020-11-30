#!/bin/bash
read s
pid=$s
echo $pid > 1.txt
while [[ $pid -gt 0 ]]
do
status="/proc/"$pid/status
ppid=$(grep -s "PPid" $status | awk '{print $2}')
if [[ -z $ppid ]]
then ppid=0
fi
echo $ppid >> 1.txt
pid=$ppid
done
