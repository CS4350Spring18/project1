#!/bin/bash
# addRecord.sh
# Michael Scales 2/8/2018

echo $1
echo $2
echo $3
echo $4

while read p; do
  echo $p
done < contacts.data
newRec="$1:$2:$3:$4"
echo $newRec
# sed -i -e "\$a$newRec" contacts.data

while read p; do
   echo $p
done < contacts.data

true
