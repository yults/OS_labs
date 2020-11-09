#!/bin/bash
while [[ true ]]
do 
read s
echo $s > pipe
if [[ $s == "QUIT" ]]
then
exit 0
fi
if [[ $s= != "+" && $s != "*" && ! $s =~ [0-9]+ ]]
then
exit 1
fi
done
