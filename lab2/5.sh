#!/bin/bash
./4.sh
last_ppid=0
art=0
cnt=0
while read line
do
ppid=$(echo "$line" | awk -F "[/=/:]" '{print $4}')
if [[ "$ppid" -eq "$last_ppid" ]]
then
cnt=$(($cnt+1))
art=$art+$(echo "$line" | awk -F "[/=/:]" '{print $6}')
else
m=$(echo "scale=5; $art/$cnt" | bc )
cnt=1
art=$(echo "$line" | awk -F "[/=/:]" '{print $6}' | bc)
echo 'Average_Sleeping_Children_of_ParentID='$last_ppid' is '$m
last_ppid=$ppid
fi
echo "$line"
done < 4.txt 
