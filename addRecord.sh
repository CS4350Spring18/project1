#!/bin/bash
# addRecord.sh
# Michael Scales 2/8/2018

# Split the input into each field for the record
IFS=':' read -r -a array <<< "$1"

# Ensure correct number of arguments were passed
if [ ${#array[@]} -lt 4 ]; then
   printf "%s\n" "Too few arguments provided." "Aborting add record."
   success=false
else
   success=true
   name=${array[0]}
   address=${array[1]}
   phone=${array[2]}
   email=${array[3]}
fi

# Check that required fields are not blank.
if [ "$success" = true ] && [ -z "$name" ] || [ -z "$email" ]; then
   printf "%s\n" "" "Error: Name and email are required fields." "You provided:" "Name: $name" \
                 "Email: $email" "Aborting add record." ""
   success=false
else
   # Enforce unique name and email for records.
   if . findRecord.sh "$name" || . findRecord.sh "$email"; then
      printf "%s\n" "" "Duplicate record found:" "Name: $name" "Email: $email" \
                    "Name and email are unique identifiers." "Aborting add record." ""
      success=false
   else
      echo "$name:$address:$phone:$email" >> contacts.data
      # Verify that our record was successfully added.
      if [ $? ]; then
         sucess=true
      else
         success=false
      fi
   fi
fi

$success
