#!/bin/bash
# removeRecord.sh
# James Garrison 2/12/2018

REMOVAL_STRING=$1

file="contacts.data"
tempFile="temp.data"

echo "$(grep -v "$REMOVAL_STRING" $file)" > "$tempFile"
mv $tempFile $file



if [ $? ]; then
  EXIT_CODE=true
else
  EXIT_CODE=false
fi

$EXIT_CODE
