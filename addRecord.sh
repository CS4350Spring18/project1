#!/bin/bash
# addRecord.sh
# Michael Scales 2/8/2018

NAME=$1
ADDRESS=$2
PHONE=$3
EMAIL=$4

echo "$NAME:$ADDRESS:$PHONE:$EMAIL" >> contacts.data

if [ $? ]; then
   while read p; do
      echo $p
   done < contacts.data
   EXIT_CODE=true
else
   EXIT_CODE=false
fi

$EXIT_CODE
