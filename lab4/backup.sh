#!/bin/bash
last=$(ls ~ | grep -E "^Backup-" | sort -n | tail -1 | sed "s/Backup-//")
cur=$(date +"%Y-%m-%d")
dt=$(echo "($(date -d "$cur" +"%s") - $(date -d "$last" +"%s")) / 60 / 60 / 24" | bc)
if (( $dt > 7 )) || [[ -z $last ]]; then 
	mkdir $HOME/Backup-$cur
	for name in $(ls ~/source); do
		cp $HOME/source/$name $HOME/Backup-$cur
	done
	files=$(ls ~/source | sed "s/^/\t/")
	echo -e "Backup $cur : \n${files}" >> ~/backup-report
else
	for name in $(ls ~/source); do
		last_backup=$HOME/Backup-$last
		if [[ -f $last_backup/$name ]]; then
			size=$(wc -c "$HOME/source/${name}" | awk '{print $1}')
			backup_size=$( wc -c "$last_backup/$name" | awk '{print $1}')
			ds=$(echo "${size} - ${backup_size}" | bc)
			if (( $ds != 0 )); then
				mv $last_backup/$name $last_backup/$name.$cur
				cp $HOME/source/$name $last_backup
				report_info="${report_info}\n\tFile ${name} was updated. Previous version: ${name}.${cur}."
			fi
		else
			cp $HOME/source/$name $last_backup
			report_info="${report_info}\n\tFile $name copied."
		fi
	done
	echo -e "Backup (${last}) updated:\n${report_info}" >> ~/backup-report
fi