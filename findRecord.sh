#!/bin/bash
# editRecord.sh
# Sherman Thompson

# Specify which file to read for the data
file="contacts.data"

# Initialize EXIT_CODE to be false
# If no match is found, the caller will get this
# and be able to process it with an if statement
EXIT_CODE=false

# Initalize found_results to be an empty string
found_results=''

# While there is a line to process from the file...
while read -r line; do

  # Separate each element in line and put into an
  # array called 'var'. They are separated by a colon.
  IFS=':' read -ra var <<< "$line"

  # For each element in the 'var' array...
  for i in "${var[@]}"; do

    # If the element is a partial string of the argument sent...
    if [[ $i == *$1* ]]; then

      # Add the entire line to the found_results variable
      # If there are multiple matches, they are separated by
      # a semi-colon.
      if [[ $found_results != '' ]]; then
        found_results+=";"
      fi
      found_results+="$line"

      # Set EXIT_CODE to true so the caller will know
      # a result was found 
      EXIT_CODE=true
    fi
  done
done < $file

# Export found_results to the caller so it can make
# use of the results in other functions
export found_results=$found_results

# Exit code is returned to be used in conditional statements
$EXIT_CODE