#!/bin/bash
# editRecord.sh
# Sherman Thompson

file="contacts.data"

EXIT_CODE=false
found_results=''

while read -r line; do
  IFS=':' read -ra var <<< "$line"
  for i in "${var[@]}"; do
    if [[ $i == *$1* ]]; then
      if [[ $found_results != '' ]]; then
        found_results+=";"
      fi
      found_results+="$line"
      EXIT_CODE=true
    fi
  done
done < $file

echo $found_results
export found_results=$found_results

$EXIT_CODE