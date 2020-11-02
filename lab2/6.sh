#!/bin/bash
max=0
vmdata=0
num_proc=""
for dir in /proc/*
do
if [[ $dir =~ "2" ]]
then
vmdata=$(awk '{print $1}' $dir/statm)
if [[ $max -le $vmdata ]]
then max=$vmdata
num_proc=$dir
fi
fi
done
echo "$num_proc $max"
