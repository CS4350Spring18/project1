#!/bin/bash
# editRecord.sh
# Sherman Thompson

file="contacts.data"

EXIT_CODE=false

while read -r line; do
  IFS=':' read -ra var <<< "$line"
  for i in "${var[@]}"; do
    if [ "$1" == "$i" ]; then
      export name="${var[0]}"
      export address="${var[1]}"
      export phone="${var[2]}"
      export email="${var[3]}"
      EXIT_CODE=true
    fi
  done
done < $file

$EXIT_CODE