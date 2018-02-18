#!/bin/bash
# menu.sh
# Michael Baum 2/6/2018


flag=0
until [ $flag -ne  0 ]; do
  printf "Welcome to my contact database, please select in the following menu:
  (a) Find a record
  (b) Add a new record
  (c) Update a record
  (d) Remove a record
  (e) List records
  (f) Quit
  > Selection is : "



  read choice
  echo "Your choice was: $choice"
  case "$choice" in
    [aA] ) printf "Search for contact with string: "; read search_string
           if . findRecord.sh "$search_string"; then
              IFS=';' read -ra var <<< "$found_results"
              printf "Contact info:\n"
              for i in "${var[@]}"; do
                IFS=':' read -ra line <<< "$i"
                name="${line[0]}"
                address="${line[1]}"
                phone="${line[2]}"
                email="${line[3]}"
                printf "Name: $name  Address: $address  Phone:  $phone Email: $email\n"
              done
           else
             printf "Contact not found.\n"
           fi;;
    [bB] ) printf "Input contact name: "; read name
           printf "Input contact address: "; read address
           printf "Input contact phone#: "; read phone
           printf "Input contact email: "; read email
           if . addRecord.sh "$name" "$address" "$phone" "$email"; then
             printf "Contact successfully added\n"
           else
             printf "Failure adding contact\n"
           fi;;
    [cC] ) printf "Input name of contact to change: "; read name
           if . findRecord.sh "$name" ; then
             . removeRecord.sh "$name"
             . addRecord.sh "$name" "$address" "$phone" "$email"
             printf "Update successful\n"
           else
             printf "Contact not found.\n"
           fi;;
    [dD] ) printf "Input name of contact to remove: "; read name
           if . findRecord.sh "$name" ; then
              IFS=';' read -ra line <<< "$found_results"
              for i in "${line[@]}"; do
                . removeRecord.sh "$i"
              done
             printf "Removal successful\n"
           else
             printf "Contact not found\n"
           fi;;
    [eE] ) printf "Listing contacts:\n"
	    . listRecords.sh
	    ;;
    [fF] ) flag=1;;
    * ) printf "Not a valid choice, please try again.\n";;
  esac
done

exit 0


