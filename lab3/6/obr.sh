#!/bin/bash
n=1
op="+"
sigterm() {
echo "quit"
exit 0
}
usr1() {
op="+"
}
usr2() {
op="*"
}
trap 'sigterm' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2
while [[ true ]] 
do
case "$op" in
"+")
let n=$n+2
;;
"*")
let n=$n\*2
;;
esac
sleep 1
echo $n
done
