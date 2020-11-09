#!/bin/bash
n=1
op="+"
(tail -f pipe) | while true; do
read s
case $s in
"+")
op="+"
;;
"*")
op="*"
;;
[0-9]*)
if [[ $op == "+" ]]
then
let n=$n+$s
else
let n=$n\*$s
fi
echo "number = ${n}"
;;
"QUIT")
echo "Planned stop"
killall tail
exit 0
;;
*)
echo "Input error"
killall tail
exit 1
esac
done
