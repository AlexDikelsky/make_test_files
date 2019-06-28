#!/bin/bash

get_string () {
	result=""
	i=0
	
	while [ "$i" -lt "$1" ]
	do
		rand="$(( RANDOM % 11 ))"
		if [ $rand -eq 10 ]
		then
			result+=' '
		else
			result+=$rand
		fi
		((i++))
	done
	echo "$result"
}

test_root=test_dir

mkdir test_dir

j=1
while [ $j -lt 6 ]
do
	mkdir $test_root/subfolder_$j
	i=1
	while [ $i -lt 6 ]
	do
		file_name_and_location=$test_root/subfolder_$j/test_$i.txt
		echo "I am the $i th file in the $j th subdir" > $file_name_and_location
		x=$( get_string 512 )
		echo "$x" >> $file_name_and_location
		((i++))
	done
	((j++))
done
