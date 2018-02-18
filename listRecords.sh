#!/bin/bash
# Julio Andrade
# 2/13/14

# Verify contacts.data has info
if [ -s contacts.data ]

all_records=''

then
	counter=0
	header="%-8s %-20s %-20s %-15s %-20s\n"
	printf "$header" "ID" "Name" "Address" "Phone" "Email" 
	while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $all_records != '' ]]; then
      all_records+=";"
    fi
    all_records+="$line"
		if [ "$counter" -gt "0" ]
		then
			IFS=':' read -r -a array <<< "$line"
			printf "%-8s %-20s %-20s %-15s %-20s \n" "$counter" "${array[0]}" "${array[1]}" "${array[2]}" "${array[3]}"
		fi
		counter=$(expr $counter + 1)
	done < contacts.data
else
	echo "The file contacts.data is empty or doesn't exist."
fi

export all_records=$all_records
