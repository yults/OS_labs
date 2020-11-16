#!/bin/bash
if [[ $# != 1 ]]; then
	echo "Wrong arguments number"
	exit 1
fi
if [[ ! -d ~/.trash ]]; then
	echo "Directory not exists"
	exit 1
fi
if [[ ! -f ~/.trash.log ]]; then
	echo "Trash.log not exists"
	exit 1
fi
if [[ -z $(grep $1 ~/.trash.log) ]]; then
	echo "No logs"
	exit 1
fi
for trashlog in $(grep $1 ~/.trash.log | awk '{print $1}'); do
	path=$(echo $trashlog | sed 's/ *$//') 
	logn=$(grep $trashlog ~/.trash.log | awk '{print $2}')
	read -p "Untrash ${path}? [Y/N] " ans
	case $ans in
		"Y")
			dir=$(echo $path | awk 'BEGIN{FS=OFS="/"}; {$NF=""; print $0}')
			name=$(echo $path | awk 'BEGIN{FS="/"}; {print $NF}')
			if [[ ! -d $dir ]]; then
				echo "Directory ${dir} not exists, file will be created in home dir"
				if [[ -f $HOME/$name ]]; then
					read -p "Can not use name ${name}. Change name " new_name
					ln ~/.trash/$logn $home/$new_name
					rm ~/.trash/$logn
				else 
					ln ~/.trash/$logn $home/$name
					rm ~/.trash/$logn 
				fi
			else
				if [[ -f $dir/$name ]]; then
					read -p "Can not use name ${name}. Change name " new_name
					ln ~/.trash/$logn $dir/$new_name
					rm ~/.trash/$logn 
				else 
					ln ~/.trash/$logn $dir/$name 
					rm ~/.trash/$logn 
				fi
			fi
		;;
		"N")
			continue
		;;
		*)
			echo "Wrong input"
			exit 1
		;;
	esac
done
