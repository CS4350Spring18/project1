#!/bin/bash
# Julio Andrade
# 2/13/14

# =================================================
# This script checks for data in contacts.data
# then steps up to the first line of entries via
# a counter variable, and uses the delimiter ':' 
# to split the elements into an array. At at end
# it prints out the elements of the database, neatly.
# =================================================

if [ -s contacts.data ]
then
	counter=0
	header="%-20s %20s %20s %20s\n"
	printf "$header"  "Name" "Address" "Phone" "Email" 
	
	while IFS='' read -r line || [[ -n "$line" ]]; do
		if [ "$counter" -gt "0" ] 
		then
			IFS=':' read -r -a array <<< "$line" 
			printf "%-20s %20s %20s %20s \n" "${array[0]}" "${array[1]}" "${array[2]}" "${array[3]}"
		fi
		counter=1
	done < contacts.data
else
	echo "The file contacts.data is empty or doesn't exist."
fi

