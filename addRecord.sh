#!/bin/bash
# addRecord.sh
# Michael Scales 2/8/2018

addRecord()
{
   name=$1
   address=$2
   phone=$3
   email=$4
   echo "$name:$address:$phone:$email" >> contacts.data
   if [ $? ]; then
      return 0
   else
      return 1
   fi
}
# Check that required fields are not blank.
if [ -z $1 ] || [ -z $4 ]; then
   printf "%s\n" "" "Error: Name and email are required fields." "You provided:" "Name: $1" \
                 "Email: $4" "Aborting add record." ""
   success=false
else
   # Enforce unique name and email for records.
   if . findRecord.sh $1 || . findRecord.sh $4; then
      printf "%s\n" "" "Duplicate record found:" "Name: $1" "Email: $4" \
                    "Name and email are unique identifiers." "Aborting add record." ""
      success=false
   else
      addRecord $1 $2 $3 $4
      # Verify that our record was successfully added.
      if [ $? ]; then
         sucess=true
      else
         success=false
      fi
   fi
fi

$success
