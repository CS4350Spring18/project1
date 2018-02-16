#!/bin/bash
# Julio Andrade
# 2/13/14

# Verify contacts.data has info
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

