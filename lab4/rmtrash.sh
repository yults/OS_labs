#!/bin/bash
n=$(cat n.txt)
let n=$n+1
echo $n > n.txt
if [[ $# != 1 ]]; then
	echo "Wrong arguments number!"
	exit 1
fi
if [[ ! -f "$1" ]]; then
	echo "File not exists"
	exit 1
fi
if [[ ! -d ~/.trash ]]; then
	mkdir ~/.trash
fi
ln "$PWD/$1" ~/.trash/$n
rm "$PWD/$1"
echo "$PWD/$1 $n" > ~/.trash.log

